using LitMotion;
using Microsoft.Extensions.Logging;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.DialogueBox;

public class TextLine : MonoBehaviour, ILayoutElement
{
    [SerializeField] [Tooltip("The text mesh pro object that contains the text")]
    private TextMeshProUGUI textMeshProUGUI = null!;

    private readonly float _animationTime = 0.3f;

    private MotionHandle? _motionHandle;

    /// <summary>
    ///     The logger used by this component.
    /// </summary>
    [Inject] internal ILogger<TextLine> Logger = null!;

#if UNITY_EDITOR
    private void OnValidate()
    {
        textMeshProUGUI = GetComponentInChildren<TextMeshProUGUI>();
    }
#endif

    public void CalculateLayoutInputHorizontal()
    {
        textMeshProUGUI.CalculateLayoutInputHorizontal();
    }

    public void CalculateLayoutInputVertical()
    {
        textMeshProUGUI.CalculateLayoutInputVertical();
        if (Mathf.Approximately(preferredHeight, textMeshProUGUI.preferredHeight)) return;
        Logger.ZLogInformation(
            $"Animating height from {preferredHeight} to {textMeshProUGUI.preferredHeight}");
        _motionHandle?.Cancel();
        _motionHandle = LMotion
            .Create(preferredHeight, textMeshProUGUI.preferredHeight, _animationTime)
            .WithEase(Ease.OutQuad)
            .Bind(newPreferredHeight =>
            {
                preferredHeight = newPreferredHeight;
                if (!isActiveAndEnabled)
                    return;
                LayoutRebuilder.MarkLayoutForRebuild(transform as RectTransform);
            });
    }

    public float minWidth => textMeshProUGUI.minWidth;
    public float preferredWidth => textMeshProUGUI.preferredWidth;
    public float flexibleWidth => textMeshProUGUI.flexibleWidth;
    public float minHeight => textMeshProUGUI.minHeight;
    public float preferredHeight { get; private set; }
    public float flexibleHeight => textMeshProUGUI.flexibleHeight;
    public int layoutPriority => textMeshProUGUI.layoutPriority;

    /// <summary>
    ///     Set the text of this line.
    /// </summary>
    /// <param name="text">The text of this line.</param>
    public void SetText(string text)
    {
        textMeshProUGUI.SetText(text);
    }
}