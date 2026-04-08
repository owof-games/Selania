using System;
using System.Collections.Generic;
using UnityEngine;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     Info about the necessary information for a single character.
    /// </summary>
    [Serializable]
    [Obsolete("Use SelaniaSettings.CharacterInfo instead")]
    public class CharacterDialogueInfo : IEquatable<CharacterDialogueInfo>
    {
        /// <summary>
        ///     Default comparer between <see cref="CharacterDialogueInfo" />.
        /// </summary>
        public static readonly EqualityComparer<CharacterDialogueInfo> DefaultComparer =
            new CharacterDialogueInfoEqualityComparer();

        [field: SerializeField]
        [field: Tooltip("The name of the character.")]
        public string name { get; private set; } = null!;

        [field: SerializeField]
        [field: Tooltip("The color which is used to write the character's name.")]
        public Color color { get; private set; } = Color.black;

        /// <inheritdoc />
        public bool Equals(CharacterDialogueInfo? other)
        {
            if (other is null) return false;
            if (ReferenceEquals(this, other)) return true;
            return name == other.name && color.Equals(other.color);
        }

        /// <inheritdoc />
        public override bool Equals(object? obj)
        {
            if (obj is null) return false;
            if (ReferenceEquals(this, obj)) return true;
            return obj.GetType() == GetType() && Equals((CharacterDialogueInfo)obj);
        }

        /// <inheritdoc />
        public override int GetHashCode()
        {
            // ReSharper disable NonReadonlyMemberInGetHashCode
            return HashCode.Combine(name, color);
            // ReSharper restore NonReadonlyMemberInGetHashCode
        }

        /// <summary>
        ///     Private class for implementing a comparer based on <see cref="CharacterDialogueInfo" />'s implementation of
        ///     <see cref="IEquatable{T}" />.
        /// </summary>
        private class CharacterDialogueInfoEqualityComparer : EqualityComparer<CharacterDialogueInfo>
        {
            /// <inheritdoc />
            public override bool Equals(CharacterDialogueInfo x, CharacterDialogueInfo y)
            {
                return x.Equals(y);
            }

            /// <inheritdoc />
            public override int GetHashCode(CharacterDialogueInfo obj)
            {
                return obj.GetHashCode();
            }
        }
    }
}