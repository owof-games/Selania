using UnityEngine;
using VContainer;
using VContainer.Unity;

namespace Selania.Rework.Components.DialogueBox;

public class DialogueBox : MonoBehaviour
{
    [SerializeField] [Tooltip("The prefab that creates a text line once instantiated.")]
    private GameObject textLinePrefab = null!;

    [SerializeField] [Tooltip("The container where all the text lines are added to.")]
    private RectTransform textLinesContainer = null!;

    /// <summary>
    ///     The scope in which this object is created.
    /// </summary>
    [Inject] internal LifetimeScope Scope = null!;

    /// <summary>
    ///     Add a new text line to the dialogue box.
    /// </summary>
    /// <param name="text">The text to add.</param>
    public void AddTextLine(string text)
    {
        using (LifetimeScope.EnqueueParent(Scope))
        {
            var textLineGameObject = Instantiate(textLinePrefab, textLinesContainer);
            var textLine = textLineGameObject.GetComponent<TextLine>();
            textLine.SetText(text);
        }
    }
}