using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class PointerHandler : MonoBehaviour, IPointerClickHandler
{
    [SerializeField] private UnityEvent onClick;
    
    public void OnPointerClick(PointerEventData eventData)
    {
        onClick.Invoke();
    }
}