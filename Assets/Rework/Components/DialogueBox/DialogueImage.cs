using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    /// Controller for the dialogue images.
    /// </summary>
    public class DialogueImage : MonoBehaviour
    {
        [Tooltip("The image component that changes image")] [SerializeField]
        private Image image = null!;

        [Tooltip("The aspect ratio component")] [SerializeField]
        private AspectRatioFitter aspectRatioFitter = null!;

        [Inject] internal ILogger<DialogueImage> Logger = null!;

        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

        /// <summary>
        /// Set the current image by name. See <see cref="ISettingsDialogueBox.GetDialogueSprite"/> and <see cref="SelaniaSettings.dialogueSpriteInfo"/>.
        /// </summary>
        /// <param name="spriteName">Name of the sprite to set.</param>
        public void SetImage(string spriteName)
        {
            // get the sprite, and exit if it's not found
            var sprite = SettingsDialogueBox.GetDialogueSprite(spriteName);

            if (sprite == null)
            {
                Logger.ZLogError($"Cannot find dialogue sprite with name {spriteName}");
                return;
            }

            // set the sprite - the image is set up to preserve aspect ratio
            image.sprite = sprite;

            // ask the layout to respect its size
            aspectRatioFitter.aspectRatio = sprite.rect.width / sprite.rect.height;
        }
    }
}