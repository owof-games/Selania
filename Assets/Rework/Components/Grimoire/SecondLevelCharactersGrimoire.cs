using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Components.DialogueBox;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.Grimoire
{
    public class SecondLevelCharactersGrimoire : MonoBehaviour, IAutomaticEditorInject
    {
        [Tooltip("All the buttons that this level presents")] [SerializeField]
        private ButtonInfo[] buttonInfo = null!;

        [Tooltip("Text Mesh Pro element that shows the character's name.")] [SerializeField]
        private TMP_Text characterNameTextMeshPro = null!;

        [Tooltip("Text Mesh Pro element that shows the character's description.")] [SerializeField]
        private TMP_Text characterDescriptionTextMeshPro = null!;

        [Tooltip("Text Mesh Pro element that shows the character's tasks.")] [SerializeField]
        private TMP_Text characterTasksTextMeshPro = null!;

        [Tooltip("Image element that shows the character's portrait.")] [SerializeField]
        private Image characterPortraitImage = null!;

        [Tooltip("The relationship status controller")] [SerializeField]
        private RelationshipStatus relationshipStatus = null!;

        [Tooltip("The pentacle controller.")] [SerializeField]
        private SecondLevelCharactersPentacle pentacle = null!;

        /// <summary>
        ///     Subject where the click observable will be sent at Start() time.
        /// </summary>
        private readonly ReplaySubject<Observable<string>> _clickObservables = new(1);

        private IDisposable? _lastCharacterRelationshipStatusSubscription;

        [Inject] internal ILogger<SecondLevelCharactersGrimoire> Logger = null!;
        [Inject] internal ISettingsBook SettingsBook = null!;
        [Inject] internal IStoryCharacterRelationshipStatus StoryCharacterRelationshipStatus = null!;
        [Inject] internal IStoryGamerMode StoryGamerMode = null!;

        /// <summary>
        ///     An observable that produces a string with the name of the button each time a button is clicked. The names
        ///     of the buttons are described in <see cref="buttonInfo" />.
        /// </summary>
        public Observable<string> clickObservable => _clickObservables.Switch();

        private void Start()
        {
            // map each button info to an observable of strings with their name, then merge them all together
            var observable = buttonInfo
                .Select(info => info.button.OnClickAsObservable().Select(_ => info.clickName))
                .Aggregate<Observable<string>, Observable<string>?>(null,
                    (current, newObservable) => current == null ? newObservable : current.Merge(newObservable));

            // send the created observable, or the empty observable if we have no buttons (this should not happen)
            _clickObservables.OnNext(observable ?? Observable.Empty<string>());

            // show elements according to the reader/gamer mode
            StoryGamerMode
                .GamerMode
                .Subscribe(gamerMode =>
                {
                    if (gamerMode) relationshipStatus.Enable();
                    else relationshipStatus.Disable();
                    pentacle.gameObject.SetActive(gamerMode);
                })
                .AddTo(this);
        }

        /// <summary>
        ///     Set up the page contents.
        /// </summary>
        /// <param name="characterName">Name of the character.</param>
        /// <param name="characterDescription">Description of the character.</param>
        /// <param name="characterTasks">Tasks of the character.</param>
        /// <param name="portraitName">
        ///     Name of the portrait (see <see cref="ISettingsBook.GetCharacterPortrait" />,
        ///     <see cref="SelaniaSettings.CharacterInfo.grimoirePortrait" />).
        /// </param>
        /// <param name="enabledButtonNames">The list of buttons enabled, identified by their name (see <see cref="buttonInfo"/>).</param>
        public void SetUpPage(string characterName, string characterDescription, string characterTasks,
            string portraitName, ICollection<string> enabledButtonNames)
        {
            characterNameTextMeshPro.text = characterName;
            characterDescriptionTextMeshPro.text = characterDescription;
            characterTasksTextMeshPro.text = characterTasks;

            var foundPortrait = SettingsBook.GetCharacterPortrait(portraitName);
            if (foundPortrait != null)
                characterPortraitImage.sprite = foundPortrait;
            else
                Logger.ZLogError($"Cannot find portrait with name {portraitName}");

            // update relationship status according to the value
            _lastCharacterRelationshipStatusSubscription?.Dispose();
            _lastCharacterRelationshipStatusSubscription = StoryCharacterRelationshipStatus
                .GetCharacterObservable(portraitName)
                .Subscribe(value => relationshipStatus.SetLevel(Mathf.InverseLerp(
                    StoryCharacterRelationshipStatus.minRelationshipValue,
                    StoryCharacterRelationshipStatus.maxRelationshipValue, value)))
                .AddTo(this);

            // update buttons
            foreach (var info in buttonInfo) info.button.interactable = false;

            foreach (var enabledButtonName in enabledButtonNames)
            {
                var info = buttonInfo.FirstOrDefault(info => info.clickName == enabledButtonName);
                if (info == null)
                    Logger.ZLogError($"Cannot find button with name {enabledButtonName}.");
                else
                    info.button.interactable = true;
            }
        }

        /// <summary>
        /// Set up the values for the various elements in the pentacle, showing an animation if the starting and
        /// ending values are different.
        /// </summary>
        /// <param name="aetherValue1"></param>
        /// <param name="aetherValue2"></param>
        /// <param name="airValue1"></param>
        /// <param name="airValue2"></param>
        /// <param name="fireValue1"></param>
        /// <param name="fireValue2"></param>
        /// <param name="earthValue1"></param>
        /// <param name="earthValue2"></param>
        /// <param name="waterValue1"></param>
        /// <param name="waterValue2"></param>
        public void SetUpPentacleValues(float aetherValue1, float aetherValue2,
            float airValue1, float airValue2,
            float fireValue1, float fireValue2,
            float earthValue1, float earthValue2,
            float waterValue1, float waterValue2)
        {
            Logger.ZLogInformation(
                $"Setting pentacle to values aether {aetherValue1} => {aetherValue2}, air {airValue1} => {airValue2}, fire {fireValue1} => {fireValue2}, earth {earthValue1} => {earthValue2}, water {waterValue1} => {waterValue2}.");
            pentacle.SetValues(aetherValue1, aetherValue2,
                airValue1, airValue2,
                fireValue1, fireValue2,
                earthValue1, earthValue2,
                waterValue1, waterValue2);
        }

        /// <summary>
        ///     Information about a single button.
        /// </summary>
        [Serializable]
        public class ButtonInfo
        {
            /// <summary>
            ///     The button component itself.
            /// </summary>
            public Button button = null!;

            /// <summary>
            ///     The name produced when the button is clicked (see <see cref="SecondLevelCharactersGrimoire.clickObservable" />).
            /// </summary>
            public string clickName = null!;
        }
    }
}