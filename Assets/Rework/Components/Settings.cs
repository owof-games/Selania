using Selania.Rework.Interfaces;
using UnityEngine;

namespace Selania.Rework.Components
{
    [CreateAssetMenu(fileName = "Settings", menuName = "Selania/Settings")]
    public class Settings : ScriptableObject, ISettingsDialogueBox
    {
        /// <inheritdoc />
        [Header("Dialogue Box")]
        [field: SerializeField]
        [field: Tooltip("Duration (in seconds) to make the text line slide in.")]
        public float textLineSlideDuration { get; private set; } = 0.3f;
    }
}