using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class ClickableArea : MonoBehaviour, IPointerClickHandler
{
    [SerializeField] private Button button;

    public void OnPointerClick(PointerEventData eventData)
    {
        button.OnPointerClick(eventData);
    }
}
