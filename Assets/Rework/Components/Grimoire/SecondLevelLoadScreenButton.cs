using R3;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Grimoire
{
    public class SecondLevelLoadScreenButton : MonoBehaviour
    {
        [SerializeField] private Button buttonComponent = null!;
        [SerializeField] private TMP_Text textComponent = null!;

        private readonly Pipe<string> _clickPipe = new();

        public Observable<string> Click => _clickPipe.Observable;

        private void OnDestroy()
        {
            _clickPipe.Dispose();
        }

        public void SetContent(IStoryStateSerializer.SaveState saveState)
        {
            textComponent.text = $"{saveState.Timestamp:G} - {saveState.RoomInkName}";
            _clickPipe.PipeIn(buttonComponent.OnClickAsObservable()
                .Do(_ => Debug.Log($"Clicked on button {textComponent.text}")).Select(_ => saveState.Descriptor));
        }
    }
}