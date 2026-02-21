using System;
using System.Collections.Generic;
using Alchemy.Inspector;
using JetBrains.Annotations;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;

namespace Selania.Rework.Components
{
    [CreateAssetMenu(fileName = "Settings", menuName = "Selania/Settings")]
    [NoReorder]
    public class SelaniaSettings : ScriptableObject, ISettingsDialogueBox, ISettingsLogger, ISettingsRooms
    {
        #region dialogue box - text

        [field: TabGroup("Dialogue Box", "Text")]
        [field: SerializeField]
        [field: Tooltip("Default color for character tags in dialogue.")]
        public Color defaultCharacterColor { get; private set; } = Color.black;

        [field: TabGroup("Dialogue Box", "Text")]
        [field: SerializeField]
        [field: Tooltip("Info about every character who can have dialogue lines.")]
        private CharacterDialogueInfo[] characterDialogueInfo = Array.Empty<CharacterDialogueInfo>();

        /// <inheritdoc />
        [field: TabGroup("Dialogue Box", "Text")]
        [field: SerializeField]
        [field: Tooltip("Speed (in pixels / seconds) to make the text line slide in.")]
        public float textLineSlideSpeed { get; private set; } = 1000;

        [field: TabGroup("Dialogue Box", "Text")]
        [field: SerializeField]
        [field: Tooltip("Time to make the dialogue window slide in (in seconds).")]
        public float slideInDuration { get; private set; } = 800;

        #endregion

        #region dialogue box - choices

        /// <inheritdoc />
        [field: TabGroup("Dialogue Box", "Choices")]
        [field: SerializeField]
        [field:
            Tooltip(
                "Percentage of indentation (relative to the total horizontal text space) for the text of the choices. Used to keep the text of choices aligned, at the right of their number.")]
        public int choiceIndentationPercentage { get; private set; } = 10;

        /// <inheritdoc />
        [field: TabGroup("Dialogue Box", "Choices")]
        [field: SerializeField]
        [field: Tooltip("Default color for choices, where it's not selected / hovered.")]
        public Color defaultChoiceColor { get; private set; } = Color.blue;

        /// <inheritdoc />
        [field: TabGroup("Dialogue Box", "Choices")]
        [field: SerializeField]
        [field: Tooltip("Color for when a choice is selected / hovered.")]
        public Color selectedChoiceColor { get; private set; } = Color.lightBlue;

        /// <inheritdoc />
        [field: TabGroup("Dialogue Box", "Choices")]
        [field: SerializeField]
        [field: Tooltip("Color for when a choice is selected / hovered.")]
        public Color hoveredChoiceColor { get; private set; } = Color.cadetBlue;

        /// <summary>
        ///     The provider which generates a dictionary from character name to its color.
        /// </summary>
        private readonly DerivedDictionaryProvider<string, Color, CharacterDialogueInfo>
            _characterDialogueLabelColorsProvider =
                new(info => info.name, info => info.color, CharacterDialogueInfo.DefaultComparer);

        /// <inheritdoc />
        public Color GetCharacterTagColorByName(string characterName)
        {
            var characterDialogueLabelColors = _characterDialogueLabelColorsProvider.Get(characterDialogueInfo);
            return characterDialogueLabelColors.TryGetValue(characterName, out var color)
                ? color
                : defaultCharacterColor;
        }

        #endregion

        #region dialogue box - portraits

        [field: TabGroup("Dialogue Box", "Portraits")]
        [SerializeField]
        [Tooltip("The default sprite to use when a tag doesn't have a corresponding sprite")]
        private Sprite defaultCharacterTagSprite = null!;

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

        [TabGroup("Dialogue Box", "Portraits")]
        [SerializeField]
        [Tooltip("The sprites corresponding to the various expressions")]
        private CharacterTagInfo[] characterTagInfo = Array.Empty<CharacterTagInfo>();

        /// <summary>
        ///     The provider which generates a dictionary from tag name to its sprite.
        /// </summary>
        private readonly DerivedDictionaryProvider<string, Sprite, CharacterTagInfo> _characterSpritesProvider =
            new(info => info.tag, info => info.sprite, CharacterTagInfo.DefaultComparer);

        /// <inheritdoc />
        public Sprite GetCharacterSpriteByTag(string tag)
        {
            var characterSprites = _characterSpritesProvider.Get(characterTagInfo);
            return characterSprites.TryGetValue(tag, out var sprite)
                ? sprite
                : defaultCharacterTagSprite;
        }

        #endregion

        #region dialogue box - relationships

        [field: TabGroup("Dialogue Box", "Relationships")]
        [field: SerializeField]
        [field: Tooltip("Color of the background bar when the relationship is considered bad.")]
        public Color badRelationshipStatusBarColor { get; private set; }

        [field: TabGroup("Dialogue Box", "Relationships")]
        [field: SerializeField]
        [field: Tooltip("Color of the background bar when the relationship is considered normal.")]
        public Color normalRelationshipStatusBarColor { get; private set; }

        [field: TabGroup("Dialogue Box", "Relationships")]
        [field: SerializeField]
        [field: Tooltip("Color of the background bar when the relationship is considered good.")]
        public Color goodRelationshipStatusBarColor { get; private set; }

        [field: TabGroup("Dialogue Box", "Relationships")]
        [field: SerializeField]
        [field: Tooltip("How long it takes for the status bar to change color and the heart to more, in seconds.")]
        public float statusChangeDuration { get; private set; }

        [field: TabGroup("Dialogue Box", "Relationships")]
        [field: SerializeField]
        [field: Tooltip("Percentage at which the relationship turns from bad to normal or viceversa.")]
        [field: Range(0f, 1f)]
        public float percentageBetweenBadAndNormalRelationshipStatusBar { get; private set; }

        [field: TabGroup("Dialogue Box", "Relationships")]
        [field: SerializeField]
        [field: Tooltip("Percentage at which the relationship turns from norma to good or viceversa.")]
        [field: Range(0f, 1f)]
        public float percentageBetweenNormalAndGoodRelationshipStatusBar { get; private set; }

        [field: TabGroup("Dialogue Box", "Relationships")]
        [field: SerializeField]
        [field: Tooltip("Percentage at which the heart turns from broken to normal or viceversa.")]
        [field: Range(0f, 1f)]
        public float percentageBetweenBrokenAndNormalHeart { get; private set; }

        [field: TabGroup("Dialogue Box", "Relationships")]
        [field: SerializeField]
        [field: Tooltip("Percentage at which the heart turns from normal to great or viceversa.")]
        [field: Range(0f, 1f)]
        public float percentageBetweenNormalAndGreatHeart { get; private set; }

        #endregion

        #region rooms

        [Title("Rooms")]
        [SerializeField]
        [Tooltip("A map between room names and the prefabs to instantiate with their content.")]
        [LabelText("Rooms list")]
        private ISettingsRooms.RoomMap[] roomsList = null!;

        public ICollection<ISettingsRooms.RoomMap> rooms => roomsList;

        #endregion

        #region logger

        [field: Title("Logger")]
        [field: SerializeField]
        [field:
            Tooltip(
                "The minimum log level to use. Every message emitted under this log level won't ever be processed, independently of more specific filters.")]
        public LogLevel minimumLogLevel { get; private set; } = LogLevel.Trace;

        // ReSharper disable once InconsistentNaming
        [SerializeField] private ProviderSettings _fileProviderSettings = new();

        // ReSharper disable once InconsistentNaming
        [SerializeField] private ProviderSettings _consoleProviderSettings = new();

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

        #endregion

#pragma warning disable CS0414
        // field used just as a separator because Alchemy is putting the tabs at the end of the form
        [SerializeField] [Title("Dialogue box")] [HideLabel]
        private string x = "(ignore this field)";
#pragma warning restore CS0414
    }
}