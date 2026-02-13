using System.Collections.Generic;
using UnityEngine;
using VContainer;
using VContainer.Unity;

namespace Selania.Rework.Components.DialogueBox
{
    /// <summary>
    ///     The view manager for the dialogue box. This script controls the behavior of the component, without handling any
    ///     model connection.
    /// </summary>
    public class DialogueBox : MonoBehaviour
    {
        [SerializeField] [Tooltip("The prefab that creates a text line once instantiated.")]
        private GameObject textLinePrefab = null!;

        [SerializeField] [Tooltip("The prefab that creates a set of choices once instantiated.")]
        private GameObject dialogueChoicesPrefab = null!;

        [SerializeField] [Tooltip("The container where all the text lines are added to.")]
        private RectTransform textLinesContainer = null!;

        /// <summary>
        ///     The scope in which this object is created.
        /// </summary>
        [Inject] internal LifetimeScope Scope = null!;

        /// <summary>
        ///     Add a new text line to the dialogue box.
        /// </summary>
        /// <param name="speaker">The character speaking; if null, the character name is not shown.</param>
        /// <param name="text">The text to add.</param>
        public void AddTextLine(string? speaker, string? text)
        {
            using (LifetimeScope.EnqueueParent(Scope))
            {
                var textLineGameObject = Instantiate(textLinePrefab, textLinesContainer);
                var textLine = textLineGameObject.GetComponent<TextLine>();
                textLine.SetText(speaker, text);
            }
        }

        public void AddChoices(IEnumerable<DialogueChoices.Choice> choices)
        {
            using (LifetimeScope.EnqueueParent(Scope))
            {
                var dialogueChoicesGameObject = Instantiate(dialogueChoicesPrefab, textLinesContainer);
                var dialogueChoices = dialogueChoicesGameObject.GetComponent<DialogueChoices>();
                dialogueChoices.SetChoices(choices);
            }
        }
    }
}