using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace Selania.Rework.Components.DialogueBox
{
    public class PortraitContainer : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private Image portraitImage = null!;

        /// <summary>
        ///     The settings for the dialogue box.
        /// </summary>
        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

        /// <summary>
        ///     Set the image of the portrait according to the tag.
        /// </summary>
        /// <param name="tagName">The tag (e.g.: mentore_bored).</param>
        public void SetImage(string tagName)
        {
            var sprite = SettingsDialogueBox.GetCharacterSpriteByTag(tagName);
            portraitImage.sprite = sprite;
        }
    }
}