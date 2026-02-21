using System;
using UnityEngine;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     Controller for the container of the ink bottles
    /// </summary>
    public class InkContainer : MonoBehaviour
    {
        [SerializeField] [Tooltip("All the ink bottles, in order")]
        private InkBottle[] inkBottles = null!;

        /// <summary>
        ///     Set the ink status.
        /// </summary>
        /// <param name="numFull">Number of full ink bottles.</param>
        /// <param name="numEmpty">Number of empty bottles.</param>
        public void SetInkStatus(int numFull, int numEmpty)
        {
            // check input validity
            if (numFull < 0)
                throw new ArgumentOutOfRangeException(nameof(numFull),
                    $"{nameof(numFull)} must be greater or equal than zero.");
            if (numEmpty < 0)
                throw new ArgumentOutOfRangeException(nameof(numEmpty),
                    $"{nameof(numEmpty)} must be greater or equal than zero.");
            if (numFull + numEmpty > 4)
                throw new ArgumentOutOfRangeException(nameof(numFull), "Cannot have more than 4 total bottles.");

            // set the bottles: first the full ones, then the empty ones, and finally clear the remaining ones
            for (var i = 0; i < numFull; i++) inkBottles[i].SetStatus(InkBottle.Status.Full);

            for (var i = numFull; i < numFull + numEmpty; i++) inkBottles[i].SetStatus(InkBottle.Status.Empty);

            for (var i = numFull + numEmpty; i < inkBottles.Length; i++) inkBottles[i].SetStatus(InkBottle.Status.None);
        }
    }
}