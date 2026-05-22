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

        [Inject] internal ILogger<DialogueImage> Logger = null!;

        [Inject] internal ISettingsDialogueBox SettingsDialogueBox = null!;

        /// <summary>
        /// Set the current image by name. See <see cref="ISettingsDialogueBox.GetDialogueSprite"/> and <see cref="SelaniaSettings.dialogueSpriteInfo"/>.
        /// </summary>
        /// <param name="spriteName">Name of the sprite to set.</param>
        public void SetImage(string spriteName)
        {
            var sprite = SettingsDialogueBox.GetDialogueSprite(spriteName);

            if (sprite == null)
            {
                Logger.ZLogError($"Cannot find dialogue sprite with name {spriteName}");
                return;
            }

            image.sprite = sprite;
        }
    }
}