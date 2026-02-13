using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;

namespace Selania.Rework.Components
{
    [CreateAssetMenu(fileName = "Settings", menuName = "Selania/Settings")]
    public class Settings : ScriptableObject, ISettingsDialogueBox, ISettingsLogger
    {
        [Header("Dialogue Box")]
        [field: SerializeField]
        [field: Tooltip("Default color for character tags in dialogue.")]
        public Color defaultCharacterColor { get; private set; } = Color.black;

        [field: SerializeField] [field: Tooltip("Info about every character who can have dialogue lines.")]
        private CharacterDialogueInfo[] characterDialogueInfo = Array.Empty<CharacterDialogueInfo>();

        // ReSharper disable once InconsistentNaming
        [SerializeField] private ProviderSettings _fileProviderSettings = new();

        // ReSharper disable once InconsistentNaming
        [SerializeField] private ProviderSettings _consoleProviderSettings = new();

        /// <summary>
        ///     The backing property for <see cref="characterDialogueLabelColors" />.
        /// </summary>
        private IDictionary<string, Color>? _characterDialogueLabelColors;

        /// <summary>
        ///     Hash of <see cref="characterDialogueInfo" /> from the last time we've transformed it into
        ///     <see cref="characterDialogueLabelColors" />.
        /// </summary>
        private int _lastCharacterDialogueInfoHash;

        /// <summary>
        ///     A map between character names and their tag colors.
        /// </summary>
        private IDictionary<string, Color> characterDialogueLabelColors
        {
            get
            {
                // TODO: in play mode, it's not necessary to keep updating the dictionary

                // check if we can re-use the dictionary.
                var hash = ((IStructuralEquatable)characterDialogueInfo).GetHashCode(
                    EqualityComparer<CharacterDialogueInfo>.Default);
                if (_characterDialogueLabelColors != null && _lastCharacterDialogueInfoHash == hash)
                    return _characterDialogueLabelColors;

                // we need to re-build the dictionary
                _characterDialogueLabelColors = characterDialogueInfo.ToDictionary(
                    info => info.name,
                    info => info.color);
                _lastCharacterDialogueInfoHash = hash;

                return _characterDialogueLabelColors;
            }
        }

        /// <inheritdoc />
        [field: SerializeField]
        [field: Tooltip("Duration (in seconds) to make the text line slide in.")]
        public float textLineSlideDuration { get; private set; } = 0.3f;

        /// <inheritdoc />
        [field: SerializeField]
        [field:
            Tooltip(
                "Percentage of indentation (relative to the total horizontal text space) for the text of the choices. Used to keep the text of choices aligned, at the right of their number.")]
        public int choiceIndentationPercentage { get; private set; } = 10;

        /// <inheritdoc />
        [field: SerializeField]
        [field: Tooltip("Default color for choices, where it's not selected / hovered.")]
        public Color defaultChoiceColor { get; private set; } = Color.blue;

        /// <inheritdoc />
        [field: SerializeField]
        [field: Tooltip("Color for when a choice is selected / hovered.")]
        public Color selectedChoiceColor { get; private set; } = Color.lightBlue;

        /// <inheritdoc />
        [field: SerializeField]
        [field: Tooltip("Color for when a choice is selected / hovered.")]
        public Color hoveredChoiceColor { get; private set; } = Color.cadetBlue;

        /// <inheritdoc />
        public Color GetCharacterTagColorByName(string characterName)
        {
            return characterDialogueLabelColors.TryGetValue(characterName, out var color)
                ? color
                : defaultCharacterColor;
        }

        [Header("Logger")]
        [field: SerializeField]
        [field:
            Tooltip(
                "The minimum log level to use. Every message emitted under this log level won't ever be processed, independently of more specific filters.")]
        public LogLevel minimumLogLevel { get; private set; } = LogLevel.Trace;

        public ISettingsLogger.IProviderSettings fileProviderSettings => _fileProviderSettings;

        public ISettingsLogger.IProviderSettings consoleProviderSettings => _consoleProviderSettings;

        [Serializable]
        public class CategorySettings : ISettingsLogger.ICategorySettings
        {
            [field: SerializeField]
            [field: Tooltip("The prefix for the name of the categories affected by this setting.")]
            public string categoryPrefix { get; private set; } = "";

            [field: SerializeField]
            [field: Tooltip("The minimum log level to use specifically for these categories.")]
            public LogLevel minimumLogLevel { get; private set; } = LogLevel.Trace;
        }

        [Serializable]
        public class ProviderSettings : ISettingsLogger.IProviderSettings
        {
            [SerializeField] [Tooltip("Specific settings for categories.")]
            private CategorySettings[] categorySettingsArray = Array.Empty<CategorySettings>();

            [field: SerializeField]
            [field: Tooltip("The minimum log level to use specifically for these categories.")]
            public LogLevel minimumLogLevel { get; private set; } = LogLevel.Trace;

            public IEnumerable<ISettingsLogger.ICategorySettings> categorySettings => categorySettingsArray;
        }
    }
}