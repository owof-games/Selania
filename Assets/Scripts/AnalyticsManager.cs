using System;
using System.Collections.Generic;
using System.Linq;
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
    private Dictionary<string, string> variableNameToColor;

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
            var id = PlayerPrefs.GetString("talo-id", Guid.NewGuid().ToString());
            await Talo.Players.Identify("custom", id);
            PlayerPrefs.SetString("talo-id", id);
            Debug.Log($"Talo initialized; user id is {id}", this);

            // save the internal name of all the stats we can use
            availableStats = (await Talo.Stats.GetStats()).Select(stat => stat.internalName).ToArray();
            Debug.Log("Talo available stats: " + string.Join(", ", availableStats), this);

            // map variable names to their colors (used when we receive a variable change info, to know the color
            // it's about, if there's one)
            variableNameToColor = new Dictionary<string, string>(
                colorVariables.Select(colorVariable =>
                    new KeyValuePair<string, string>(colorVariable.variableName, colorVariable.color)));

            // save the current value of all the variables we're interested in
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
                        $"Got float value {floatValue} for variable ${variableName}, which is not really an integer");

                return roundedValue;
            }
            default:
                throw new Exception(
                    $"Cannot read ink variable ${variableName} as an integer; got a {value.GetType().FullName} ({value})");
        }
    }

    private async void Initialize()
    {
        try
        {
            Debug.Log("Starting second phase of analytics manager initialization.", this);

            // register an observer for each variable, in order to get noticed when it changes
            unregisterActions = (
                from colorVariable in colorVariables
                select dialogueManager.RegisterVariableObserver(colorVariable.variableName, OnVariableChange)
            ).ToList();

            // register an observer also for each extra variable
            unregisterActions.AddRange(from extraTrackedVariable in extraTrackedVariables
                select dialogueManager.RegisterVariableObserver(extraTrackedVariable, OnVariableChange));

            // set a player prop with the current info about every color
            foreach (var color in (from colorVariable in colorVariables select colorVariable.color).Distinct())
                await UpdatePlayerPropForColor(color);

            // set a player prop with the current info about every color variable
            foreach (var colorVariable in colorVariables)
                await UpdatePlayerPropForColorVariable(colorVariable.variableName);

            // set a player prop with the current info about every extra variable
            foreach (var extraTrackedVariable in extraTrackedVariables)
                await UpdatePlayerPropForVariable(extraTrackedVariable);

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

    /// <summary>
    ///     Callback method invoked whenever a color variable changed.
    /// </summary>
    /// <param name="variableName">The variable that changed.</param>
    /// <param name="newValue">Its new value.</param>
    private async void OnVariableChange(string variableName, object newValue)
    {
        try
        {
            // extract the color of this variable
            if (variableNameToColor.TryGetValue(variableName, out var color))
            {
                // send an event about the variable change.
                await Talo.Events.Track("variable_changed", ("type", "color"), ("name", variableName),
                    ("newValue", newValue.ToString()));

                // update the player props
                await UpdatePlayerPropForColorVariable(variableName);
                await UpdatePlayerPropForColor(color);
                await Talo.Players.Update();
            }
            else if (extraTrackedVariables.Contains(variableName))
            {
                // send an event about the variable change.
                await Talo.Events.Track("variable_changed", ("type", "extra"), ("name", variableName),
                    ("newValue", newValue.ToString()));

                // update the player props
                await UpdatePlayerPropForVariable(variableName);
                await Talo.Players.Update();
            }
            else
            {
                Debug.LogError(
                    $"Received notification about the change of variable {variableName}, but this variable has no color associated and is not between the extra tracked variables",
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
    /// <param name="variableName">The name of the updated color variable.</param>
    private async Awaitable UpdatePlayerPropForColorVariable(string variableName)
    {
        var (oldValue, newValue) = await UpdatePlayerPropForVariable(variableName);
        await UpdateStat(variableName, oldValue, newValue);
    }

    /// <summary>
    ///     Update the player props, setting the value of a specific variable.
    /// </summary>
    /// <param name="variableName">The name of the updated variable.</param>
    /// <returns>The old and new values of the variable.</returns>
    private async Awaitable<(int oldValue, int newValue)> UpdatePlayerPropForVariable(string variableName)
    {
        // update data structures to track changes
        var oldValue = lastObservedVariableValue[variableName];
        var newValue = GetIntVariableValue(variableName);
        lastObservedVariableValue[variableName] = newValue;

        // update player's property and stat
        await Talo.CurrentPlayer.SetProp(
            $"variable-{variableName}",
            FormatForTaloPlayerProp(newValue),
            false
        );
        return (oldValue, newValue);
    }

    /// <summary>
    ///     Update the player props, setting the value for a specific color.
    /// </summary>
    /// <param name="color">The color to update.</param>
    private async Awaitable UpdatePlayerPropForColor(string color)
    {
        // compute the sum of all the color variables for the given color
        var totalColor = (from colorVariable in colorVariables
            where colorVariable.color == color
            select GetColorVariableValue(colorVariable)).Sum();
        // update data structures
        if (!lastComputedColorValue.ContainsKey(color))
        {
            var stat = await Talo.Stats.FindPlayerStat(color);
            lastComputedColorValue[color] = (int)stat.value;
        }

        var oldValue = lastComputedColorValue[color];
        lastComputedColorValue[color] = totalColor;
        // send to talo
        await Talo.CurrentPlayer.SetProp($"color-{color}", FormatForTaloPlayerProp(totalColor), false);
        await UpdateStat(color, oldValue, totalColor);
    }

    /// <summary>
    ///     Update a Talo stat, if available.
    /// </summary>
    /// <param name="statName">The stat to update.</param>
    /// <param name="oldValue">The previous value of the stat.</param>
    /// <param name="newValue">The new value of the stat.</param>
    private async Awaitable UpdateStat(string statName, int oldValue, int newValue)
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
    ///     Format a number for sending it as a talo player property.
    /// </summary>
    /// <param name="number">The number to format.</param>
    /// <returns>A string containing the number formatted in a convenient way for Talo.</returns>
    private static string FormatForTaloPlayerProp(int number)
    {
        return number.ToString("000");
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
    }
}