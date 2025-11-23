using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TaloGameServices;
using UnityEngine;

/// <summary>
///     The Analytics manager performs the following tracking.
///     AT STARTUP updates the user prop with the value of each color variable, and each aggregated color value.
///     WHENEVER A COLOR VARIABLE CHANGES sends an event about the change of the value, and updates the player props
///     mentioned above.
/// </summary>
public class AnalyticsManager : MonoBehaviour
{
    [Tooltip("The dialogue manager from which we read the changes we're interested in")] [SerializeField]
    private DialogueManagerSingleInk dialogueManager;

    [Tooltip("The list of variables referring to colors")] [SerializeField]
    private ColorVariable[] colorVariables;

    [Tooltip("The list of extra variables to track as player props, in addiction to colorVariables")] [SerializeField]
    private string[] extraTrackedVariables;

    /// <summary>
    ///     The last value that was computed for a given color.
    /// </summary>
    private readonly Dictionary<string, int> lastComputedColorValue = new();

    /// <summary>
    ///     The info about the last line with choices, or null if the last line had no choices.
    /// </summary>
    private LastLineWithChoices _lastLineWithChoices;

    /// <summary>
    ///     The internal name of all the stats that can be set on Talo.
    /// </summary>
    private string[] availableStats;

    /// <summary>
    ///     The value of a variable the last time it was observed.
    /// </summary>
    private Dictionary<string, int> lastObservedVariableValue;

    /// <summary>
    ///     All the actions to call in order to unregister the color variable observers.
    /// </summary>
    private List<Action> unregisterActions;

    /// <summary>
    ///     A map between variable names and their relative colors.
    /// </summary>
    private Dictionary<string, ColorVariable> variableNameToColor;

    private async void Start()
    {
        try
        {
            Debug.Log("Starting first phase of analytics manager initialization.", this);

            // check that we set a dialogue manager in unity
            if (dialogueManager == null)
            {
                Debug.LogError("Dialogue Manager not set.", this);
                return;
            }

            // initialize talo by identifying the player in a unique way
            var playerId = PlayerPrefs.GetString("talo-id", Guid.NewGuid().ToString());
            var id = Guid.NewGuid().ToString();
            await Talo.Players.Identify("custom", id);
            await Talo.CurrentPlayer.SetProp("player_id", playerId);
            PlayerPrefs.SetString("talo-id", playerId);
            Debug.Log($"Talo initialized; user id is {playerId}, session id is {id}", this);

            // save the internal name of all the stats we can use
            availableStats = (await Talo.Stats.GetStats()).Select(stat => stat.internalName).ToArray();
            Debug.Log("Talo available stats: " + string.Join(", ", availableStats), this);

            // map variable names to their color variable (used when we receive a variable change info, to know the color
            // it's about, if there's one)
            variableNameToColor = new Dictionary<string, ColorVariable>(
                colorVariables.Select(colorVariable =>
                    new KeyValuePair<string, ColorVariable>(colorVariable.variableName, colorVariable)));

            // save the current value of all the variables we're interested in (color and extra variables)
            lastObservedVariableValue = new Dictionary<string, int>(
                from variableName in colorVariables.Select(colorVariable => colorVariable.variableName)
                    .Concat(extraTrackedVariables)
                select new KeyValuePair<string, int>(
                    variableName,
                    GetIntVariableValue(variableName)));

            Debug.Log("First phase of analytics manager initialization completed.", this);

            // check if we can immediately continue with the ink-dependent initialization or must wait for the story to load
            if (dialogueManager.IsInkStoryLoaded)
                Initialize();
            else
                dialogueManager.onInkStoryLoaded.AddListener(Initialize);
        }
        catch (Exception e)
        {
            Debug.LogError(
                "Something went wrong during the first phase of analytics initialization (see error below for more details)",
                this);
            Debug.LogError(e, this);
        }
    }

    private void OnDestroy()
    {
        // de-register all the variable observers when this manager is destroyed
        if (unregisterActions == null) return;

        foreach (var action in unregisterActions)
            try
            {
                action();
            }
            catch (Exception e)
            {
                Debug.LogError("Error during de-initialization", this);
                Debug.LogError(e, this);
            }
    }

#if UNITY_EDITOR

    private void OnValidate()
    {
        // fill the dialogueManager variable with the (only) instance
        if (!dialogueManager) dialogueManager = FindAnyObjectByType<DialogueManagerSingleInk>();
    }

#endif

    private int GetColorVariableValue(ColorVariable colorVariable)
    {
        Debug.Log($"Getting value of variable {colorVariable.variableName}");
        var variableName = colorVariable.variableName;
        return GetIntVariableValue(variableName);
    }

    private int GetIntVariableValue(string variableName)
    {
        var value = dialogueManager.GetVariableValue(variableName);
        switch (value)
        {
            case int intValue:
                return intValue;
            case float floatValue:
            {
                var roundedValue = Mathf.RoundToInt(floatValue);
                if (Mathf.Abs(floatValue - roundedValue) > 0.01f)
                    Debug.LogWarning(
                        $"Got float value {floatValue} for variable {variableName}, which is not really an integer");

                return roundedValue;
            }
            default:
                throw new Exception(
                    $"Cannot read ink variable {variableName} as an integer; got a {value.GetType().FullName} ({value})");
        }
    }

    private async void Initialize()
    {
        try
        {
            Debug.Log("Starting second phase of analytics manager initialization.", this);

            // register an observer for each variable to get noticed when it changes
            unregisterActions = (
                from colorVariable in colorVariables
                select dialogueManager.RegisterVariableObserver(colorVariable.variableName, OnColorVariableChanged)
            ).ToList();

            // register an observer also for each extra variable
            unregisterActions.AddRange(from extraTrackedVariable in extraTrackedVariables
                select dialogueManager.RegisterVariableObserver(extraTrackedVariable, OnExtraVariableChanged));

            // register an observer for the changes in story step
            dialogueManager.onStoryStep.AddListener(OnStoryStep);

            // set a player prop with the current info about every color
            foreach (var color in (from colorVariable in colorVariables select colorVariable.color).Distinct())
                await UpdateTaloForColorChange(color);

            // set a player prop with the current info about every color+character
            foreach (var colorVariable in colorVariables)
                await UpdateTaloForColorVariableChange(colorVariable, true);

            // set a player prop with the current info about every extra variable
            foreach (var extraTrackedVariable in extraTrackedVariables)
                await UpdatePlayerPropForVariable(extraTrackedVariable, true);

            // send the updates in block
            await Talo.Players.Update();

            Debug.Log("Second phase of analytics manager initialization completed.", this);
        }
        catch (Exception e)
        {
            Debug.LogError(
                "Something went wrong during the second phase of analytics initialization (see error below for more details)",
                this);
            Debug.LogError(e, this);
        }
    }

    private void OnStoryStep(DialogueManagerSingleInk.StoryStepEvent storyStepEvent)
    {
        // update _lastLineWithChoices according to the current line, to use when a color changes
        if (!storyStepEvent.HasChoices || storyStepEvent.IsCommand) return;

        _lastLineWithChoices = new LastLineWithChoices
        {
            CurrentText = storyStepEvent.CurrentText.Trim(),
            PreviousPathString = storyStepEvent.PreviousPathString
        };
    }

    /// <summary>
    ///     Callback method invoked whenever a color variable changed.
    /// </summary>
    /// <param name="variableName">The color variable that changed.</param>
    /// <param name="newValue">Its new value.</param>
    private async void OnColorVariableChanged(string variableName, object newValue)
    {
        try
        {
            // cache the value in the local stack since we're an async void method, and execution can go on without waiting
            // for the async method to finish
            var lastLineWithChoices = _lastLineWithChoices;

            // create a context to update the player props and stats at once, and only if something actually changed
            await using var taloPlayersUpdateContext = new TaloPlayersUpdateContext();

            // extract the color of this variable
            if (!variableNameToColor.TryGetValue(variableName, out var colorVariable))
            {
                Debug.LogError(
                    $"Received notification about the change of color variable {variableName}, but this variable has no color associated and is not between the extra tracked variables",
                    this);
                return;
            }

            // update the color player props and stats
            var actuallyUpdated = await UpdateTaloForColorVariableChange(colorVariable);
            if (!actuallyUpdated) return; // nothing actually changed, so we can skip the rest of the steps

            taloPlayersUpdateContext.Changed();
            await UpdateTaloForColorChange(colorVariable.color);

            // send an event about the variable change.
            await Talo.Events.Track("variable_changed", ("type", "color"), ("name", variableName),
                ("newValue", newValue.ToString()));

            // update the choice player props and send events
            if (lastLineWithChoices == null)
            {
                Debug.LogError("Received a color change event before any choice was faced by the player.");
                return;
            }

            await Talo.CurrentPlayer.SetProp($"choice_color_{lastLineWithChoices.PreviousPathString}_text",
                lastLineWithChoices.CurrentText, false);
            await Talo.CurrentPlayer.SetProp($"choice_color_{lastLineWithChoices.PreviousPathString}_color",
                colorVariable.color, false);
            await Talo.Events.Track("color_choice_taken", ("path", lastLineWithChoices.PreviousPathString),
                ("text", lastLineWithChoices.CurrentText), ("color", colorVariable.color));
        }
        catch (Exception e)
        {
            Debug.LogError(
                "Something went wrong during the update of a player prop (see error below for more details)",
                this);
            Debug.LogError(e, this);
        }
    }

    /// <summary>
    ///     Callback method invoked whenever an extra variable changed.
    /// </summary>
    /// <param name="variableName">The extra variable that changed.</param>
    /// <param name="newValue">Its new value.</param>
    private async void OnExtraVariableChanged(string variableName, object newValue)
    {
        try
        {
            if (extraTrackedVariables.Contains(variableName))
            {
                await using var taloPlayersUpdateContext = new TaloPlayersUpdateContext();

                // send an event about the variable change.
                await Talo.Events.Track("variable_changed", ("type", "extra"), ("name", variableName),
                    ("newValue", newValue.ToString()));

                // update the player props
                await UpdatePlayerPropForVariable(variableName);
                taloPlayersUpdateContext.Changed();
            }
            else
            {
                Debug.LogError(
                    $"Received notification about the change of extra variable {variableName}, but this variable is not between the extra tracked variables",
                    this);
            }
        }
        catch (Exception e)
        {
            Debug.LogError(
                "Something went wrong during the update of a player prop (see error below for more details)",
                this);
            Debug.LogError(e, this);
        }
    }

    /// <summary>
    ///     Update the player props, setting the value of a specific color variable.
    /// </summary>
    /// <param name="colorVariable">The color variable to update.</param>
    /// <param name="forceUpdate">
    ///     Whether to force the update of the prop on the Talo side even when it didn't actually change
    ///     locally; this is useful during initialization.
    /// </param>
    /// <returns>Whether the value was actually different from the previous value</returns>
    private async Awaitable<bool> UpdateTaloForColorVariableChange(ColorVariable colorVariable,
        bool forceUpdate = false)
    {
        // try to update the player prop, if necessary
        var (oldValue, newValue) = await UpdatePlayerPropForVariable(colorVariable.variableName, forceUpdate);
        // Update the stat too (if necessary)
        if (forceUpdate || oldValue != newValue)
            await UpdateTaloStat($"character_{colorVariable.character}_{colorVariable.color}", oldValue, newValue);

        return oldValue != newValue;
    }

    /// <summary>
    ///     Update a Talo stat, simplifying the delta mechanism.
    /// </summary>
    /// <param name="statName">The stat to update.</param>
    /// <param name="oldValue">The previous value of the stat.</param>
    /// <param name="newValue">The new value of the stat.</param>
    private async Awaitable UpdateTaloStat(string statName, int oldValue, int newValue)
    {
        if (availableStats.Contains(statName))
        {
            var delta = newValue - oldValue;
            if (delta > 0) await Talo.Stats.Track(statName, delta);
        }
        else
        {
            Debug.LogWarning($"No stat for {statName} to update");
        }
    }

    /// <summary>
    ///     Update the player props, setting the value of a specific variable.
    /// </summary>
    /// <param name="variableName">The name of the updated variable.</param>
    /// <param name="forceUpdate">
    ///     Whether to force the update of the prop on the Talo side even when it didn't actually change
    ///     locally; this is useful during initialization.
    /// </param>
    /// <returns>The old and new values of the variable.</returns>
    private async Awaitable<(int oldValue, int newValue)> UpdatePlayerPropForVariable(string variableName,
        bool forceUpdate = false)
    {
        // update data structures to track changes
        var oldValue = lastObservedVariableValue[variableName];
        var newValue = GetIntVariableValue(variableName);
        lastObservedVariableValue[variableName] = newValue;

        // update player's property and stat
        if (forceUpdate || oldValue != newValue)
            await Talo.CurrentPlayer.SetProp(
                $"variable_{variableName}",
                FormatForTaloPlayerProp(newValue),
                false
            );

        return (oldValue, newValue);
    }

    /// <summary>
    ///     Update the player props and stats when a color changes.
    /// </summary>
    /// <param name="color">The color to update.</param>
    private async Awaitable UpdateTaloForColorChange(string color)
    {
        var statName = $"color_global_{color}";

        // compute the sum of all the color variables for the given color
        var totalColor = (from colorVariable in colorVariables
            where colorVariable.color == color
            select GetColorVariableValue(colorVariable)).Sum();

        // check the previous value and update it
        if (!lastComputedColorValue.ContainsKey(color))
        {
            var stat = await Talo.Stats.FindPlayerStat(statName);
            lastComputedColorValue[color] = (int)stat.value;
        }

        var oldValue = lastComputedColorValue[color];
        lastComputedColorValue[color] = totalColor;

        // update Talo prop
        await Talo.CurrentPlayer.SetProp($"color_{color}", FormatForTaloPlayerProp(totalColor), false);

        // update Talo stat
        await UpdateTaloStat(statName, oldValue, totalColor);
    }

    /// <summary>
    ///     Format a number for sending it as a talo player property.
    /// </summary>
    /// <param name="number">The number to format.</param>
    /// <returns>A string containing the number formatted in a convenient way for Talo.</returns>
    private static string FormatForTaloPlayerProp(int number)
    {
        return number.ToString("000");
    }

    /// <summary>
    ///     Class to pack together all the information we need in case we faced a choice with a color change.
    /// </summary>
    private class LastLineWithChoices
    {
        public string CurrentText;
        public string PreviousPathString;
    }

    private sealed class TaloPlayersUpdateContext : IAsyncDisposable
    {
        private bool _changed;

        public async ValueTask DisposeAsync()
        {
            if (!_changed) return;
            await Talo.Players.Update();
        }

        public void Changed()
        {
            _changed = true;
        }
    }

    /// <summary>
    ///     A map between a variable name and the "choice color" it refers to.
    /// </summary>
    [Serializable]
    public struct ColorVariable
    {
        /// <summary>
        ///     Name of the variable. Whenever this Ink variable changes, it means a choice relative to the given color
        ///     has been taken.
        /// </summary>
        public string variableName;

        /// <summary>
        ///     The color of the choice.
        /// </summary>
        public string color;

        /// <summary>
        ///     Name of the character.
        /// </summary>
        public string character;
    }
}