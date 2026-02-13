using System;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.DialogueBox
{
    public class InkBottle : MonoBehaviour
    {
        /// <summary>
        ///     Possible status of an ink bottle.
        /// </summary>
        public enum Status
        {
            /// <summary>
            ///     No bottle at all (no image).
            /// </summary>
            None,

            /// <summary>
            ///     Empty bottle.
            /// </summary>
            Empty,

            /// <summary>
            ///     Full bottle.
            /// </summary>
            Full
        }

        [SerializeField] [Tooltip("The image component to set")]
        private Image image = null!;

        [SerializeField] [Tooltip("Image when there's no bottle")]
        private Sprite noBottle = null!;

        [SerializeField] [Tooltip("Image when there's a full bottle")]
        private Sprite fullBottle = null!;

        [SerializeField] [Tooltip("Image when there's an empty bottle")]
        private Sprite emptyBottle = null!;

#if UNITY_EDITOR
        private void OnValidate()
        {
            image = GetComponentInChildren<Image>();
        }
#endif

        /// <summary>
        ///     Set the status of this ink bottle.
        /// </summary>
        /// <param name="newStatus">The new status for the ink bottle.</param>
        /// <exception cref="ArgumentOutOfRangeException">If the status is unknown.</exception>
        public void SetStatus(Status newStatus)
        {
            image.sprite = newStatus switch
            {
                Status.None => noBottle,
                Status.Empty => emptyBottle,
                Status.Full => fullBottle,
                _ => throw new ArgumentOutOfRangeException(nameof(newStatus), newStatus, null)
            };
        }
    }
}