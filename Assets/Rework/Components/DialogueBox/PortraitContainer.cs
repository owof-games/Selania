using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     Controller for the portrait.
    /// </summary>
    public class PortraitContainer : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private Image portraitImage1 = null!;
        [SerializeField] private Image portraitImage2 = null!;

        /// <summary>
        ///     The settings for the dialogue box.
        /// </summary>
        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

        /// <summary>
        ///     Set the image of the portrait according to the tag.
        /// </summary>
        /// <param name="usePortrait1">Whether to use the portrait 1.</param>
        /// <param name="mood">The mood (e.g.: neutral, bored, ...)</param>
        /// <param name="character">The character (e.g.: FirstCharacter, SecondCharacter, ...).</param>
        public void SetImage(string character, string mood, bool usePortrait1)
        {
            var sprite = SettingsDialogueBox.GetMoodSprite(character, mood);
            (usePortrait1 ? portraitImage1 : portraitImage2).sprite = sprite;
        }

        /// <summary>
        ///     Clear the images and reset them.
        /// </summary>
        public void ClearImages()
        {
            portraitImage1.sprite = null;
            portraitImage2.sprite = null;
        }
    }
}