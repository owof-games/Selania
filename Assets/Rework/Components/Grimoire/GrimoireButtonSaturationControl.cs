using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Grimoire
{
    /// <summary>
    ///     Component that allows for changing the saturation of the button image.
    /// </summary>
    public class GrimoireButtonSaturationControl : MonoBehaviour
    {
        private static readonly int SaturationProperty = Shader.PropertyToID("_Saturation");
        private static readonly int ColorProperty = Shader.PropertyToID("_Color");

        private static readonly Dictionary<float, Material> MaterialsBySaturation = new();

        private static readonly Dictionary<(float, Color), Material> MaterialsBySaturationAndColor = new();

        [Tooltip("The image whose saturation will be changed.")] [SerializeField]
        private Image image = null!;

        private void Start()
        {
            if (!MaterialsBySaturation.ContainsKey(1)) MaterialsBySaturation[1] = image.material;
            if (!MaterialsBySaturationAndColor.ContainsKey((1, Color.white))) MaterialsBySaturation[1] = image.material;
        }

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
        private static void ResetMaterialsBySaturation()
        {
            MaterialsBySaturation.Clear();
            MaterialsBySaturationAndColor.Clear();
        }

        /// <summary>
        ///     Set the saturation of the image.
        /// </summary>
        /// <param name="saturation">The new saturation (0..1).</param>
        public void SetSaturation(float saturation)
        {
            saturation = Mathf.Clamp(saturation, 0, 1);
            if (!MaterialsBySaturation.ContainsKey(saturation))
            {
                var saturationMaterial = new Material(MaterialsBySaturation[1]);
                saturationMaterial.SetFloat(SaturationProperty, saturation);
                MaterialsBySaturation[saturation] = saturationMaterial;
            }

            image.material = MaterialsBySaturation[saturation];
        }

        /// <summary>
        ///     Set the saturation and color of the image.
        /// </summary>
        /// <param name="saturation">The new saturation (0..1).</param>
        /// <param name="color">the new color</param>
        public void SetSaturation(float saturation, Color color)
        {
            saturation = Mathf.Clamp(saturation, 0, 1);
            if (!MaterialsBySaturationAndColor.ContainsKey((saturation, color)))
            {
                var saturationMaterial = new Material(MaterialsBySaturation[1]);
                saturationMaterial.SetFloat(SaturationProperty, saturation);
                saturationMaterial.SetColor(ColorProperty, color);
                MaterialsBySaturationAndColor[(saturation, color)] = saturationMaterial;
            }

            image.material = MaterialsBySaturationAndColor[(saturation, color)];
        }
    }
}