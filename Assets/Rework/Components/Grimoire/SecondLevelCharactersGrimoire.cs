using System;
using System.Linq;
using Microsoft.Extensions.Logging;
using R3;
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

        /// <summary>
        ///     Subject where the click observable will be sent at Start() time.
        /// </summary>
        private readonly Subject<Observable<string>> _clickObservables = new();

        [Inject] internal ILogger<SecondLevelCharactersGrimoire> Logger = null!;
        [Inject] internal ISettingsBook SettingsBook = null!;

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
        public void SetUpPage(string characterName, string characterDescription, string characterTasks,
            string portraitName)
        {
            characterNameTextMeshPro.text = characterName;
            characterDescriptionTextMeshPro.text = characterDescription;
            characterTasksTextMeshPro.text = characterTasks;

            var foundPortrait = SettingsBook.GetCharacterPortrait(portraitName);
            if (foundPortrait != null)
                characterPortraitImage.sprite = foundPortrait;
            else
                Logger.ZLogError($"Cannot find portrait with name {portraitName}");
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