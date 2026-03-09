using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Grimoire
{
    /// <summary>
    ///     Component that allows for changing the saturation of the button image.
    /// </summary>
    public class GrimoireButtonSaturationControl : MonoBehaviour
    {
        private static readonly int Saturation = Shader.PropertyToID("_Saturation");

        [Tooltip("The image whose saturation will be changed.")] [SerializeField]
        private Image image = null!;

        /// <summary>
        ///     Set the saturation of the image.
        /// </summary>
        /// <param name="saturation">The new saturation (0..1).</param>
        public void SetSaturation(float saturation)
        {
            saturation = Mathf.Clamp(saturation, 0, 1);
            image.material.SetFloat(Saturation, saturation);
        }
    }
}