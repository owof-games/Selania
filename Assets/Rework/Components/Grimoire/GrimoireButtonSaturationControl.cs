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
        private static readonly int Saturation = Shader.PropertyToID("_Saturation");

        private static readonly Dictionary<float, Material> MaterialsBySaturation = new();

        [Tooltip("The image whose saturation will be changed.")] [SerializeField]
        private Image image = null!;

        private void Start()
        {
            if (!MaterialsBySaturation.ContainsKey(1)) MaterialsBySaturation[1] = image.material;
        }

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
        private static void ResetMaterialsBySaturation()
        {
            MaterialsBySaturation.Clear();
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
                saturationMaterial.SetFloat(Saturation, saturation);
                MaterialsBySaturation[saturation] = saturationMaterial;
            }

            image.material = MaterialsBySaturation[saturation];
        }
    }
}