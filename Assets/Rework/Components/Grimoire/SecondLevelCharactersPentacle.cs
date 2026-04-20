using UnityEngine;

namespace Selania.Rework.Components.Grimoire
{
    public class SecondLevelCharactersPentacle : MonoBehaviour
    {
        [SerializeField] private SecondLevelCharactersPentacleTriangle aetherTriangle = null!;
        [SerializeField] private SecondLevelCharactersPentacleTriangle airTriangle = null!;
        [SerializeField] private SecondLevelCharactersPentacleTriangle fireTriangle = null!;
        [SerializeField] private SecondLevelCharactersPentacleTriangle earthTriangle = null!;
        [SerializeField] private SecondLevelCharactersPentacleTriangle waterTriangle = null!;

        /// <summary>
        /// Show an animation for the values, or just display the value if the starting and ending values are the same.
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
        public void SetValues(
            float aetherValue1, float aetherValue2,
            float airValue1, float airValue2,
            float fireValue1, float fireValue2,
            float earthValue1, float earthValue2,
            float waterValue1, float waterValue2
        )
        {
            aetherTriangle.SetValue(aetherValue1, aetherValue2);
            airTriangle.SetValue(airValue1, airValue2);
            fireTriangle.SetValue(fireValue1, fireValue2);
            earthTriangle.SetValue(earthValue1, earthValue2);
            waterTriangle.SetValue(waterValue1, waterValue2);
        }
    }
}