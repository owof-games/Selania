using System;
using System.Collections.Generic;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;

namespace Selania.Rework.Components
{
    [CreateAssetMenu(fileName = "Settings", menuName = "Selania/Settings")]
    public class SelaniaSettings : ScriptableObject, ISettingsDialogueBox, ISettingsLogger
    {
        [field: Header("Dialogue Box")]
        [field: SerializeField]
        [field: Tooltip("Default color for character tags in dialogue.")]
        public Color defaultCharacterColor { get; private set; } = Color.black;

        [field: SerializeField] [field: Tooltip("Info about every character who can have dialogue lines.")]
        private CharacterDialogueInfo[] characterDialogueInfo = Array.Empty<CharacterDialogueInfo>();

        [SerializeField] [Tooltip("The default sprite to use when a tag doesn't have a corresponding sprite")]
        private Sprite defaultCharacterTagSprite = null!;

        [SerializeField] [Tooltip("The sprites corresponding to the various expressions")]
        private CharacterTagInfo[] characterTagInfo = Array.Empty<CharacterTagInfo>();

        // ReSharper disable once InconsistentNaming
        [SerializeField] private ProviderSettings _fileProviderSettings = new();

        // ReSharper disable once InconsistentNaming
        [SerializeField] private ProviderSettings _consoleProviderSettings = new();

        /// <summary>
        ///     The provider which generates a dictionary from character name to its color.
        /// </summary>
        private readonly DerivedDictionaryProvider<string, Color, CharacterDialogueInfo>
            _characterDialogueLabelColorsProvider =
                new(info => info.name, info => info.color, CharacterDialogueInfo.DefaultComparer);

        /// <summary>
        ///     The provider which generates a dictionary from tag name to its sprite.
        /// </summary>
        private readonly DerivedDictionaryProvider<string, Sprite, CharacterTagInfo> _characterSpritesProvider =
            new(info => info.tag, info => info.sprite, CharacterTagInfo.DefaultComparer);

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
            var characterDialogueLabelColors = _characterDialogueLabelColorsProvider.Get(characterDialogueInfo);
            return characterDialogueLabelColors.TryGetValue(characterName, out var color)
                ? color
                : defaultCharacterColor;
        }

        /// <inheritdoc />
        public Sprite GetCharacterSpriteByTag(string tag)
        {
            var characterSprites = _characterSpritesProvider.Get(characterTagInfo);
            return characterSprites.TryGetValue(tag, out var sprite)
                ? sprite
                : defaultCharacterTagSprite;
        }

        [field: Header("Logger")]
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

        [Serializable]
        public class CharacterTagInfo
        {
            public static readonly EqualityComparer<CharacterTagInfo> DefaultComparer =
                new CharacterTagInfoEqualityComparer();

            [field: SerializeField]
            [field: Tooltip("The tag this entry describes (e.g.: mentore_bored)")]
            public string tag { get; private set; } = "";

            [field: SerializeField]
            [field: Tooltip("The sprite for this tag")]
            public Sprite sprite { get; private set; } = null!;

            public bool Equals(CharacterTagInfo? other)
            {
                if (other is null) return false;
                if (ReferenceEquals(this, other)) return true;
                return tag == other.tag && sprite.Equals(other.sprite);
            }

            public override bool Equals(object? obj)
            {
                if (obj is null) return false;
                if (ReferenceEquals(this, obj)) return true;
                return obj.GetType() == GetType() && Equals((CharacterTagInfo)obj);
            }

            public override int GetHashCode()
            {
                // ReSharper disable NonReadonlyMemberInGetHashCode
                return HashCode.Combine(tag, sprite);
                // ReSharper restore NonReadonlyMemberInGetHashCode
            }


            private class CharacterTagInfoEqualityComparer : EqualityComparer<CharacterTagInfo>
            {
                public override bool Equals(CharacterTagInfo x, CharacterTagInfo y)
                {
                    return x.Equals(y);
                }

                public override int GetHashCode(CharacterTagInfo obj)
                {
                    return obj.GetHashCode();
                }
            }
        }
    }
}