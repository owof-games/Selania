using System;
using R3;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace Selania.Rework.Components.Grimoire
{
    public class SecondLevelLoadScreenButton : MonoBehaviour
    {
        [SerializeField] private Button buttonComponent = null!;
        [SerializeField] private TMP_Text roomTextComponent = null!;
        [SerializeField] private TMP_Text timeStampTextComponent = null!;
        [SerializeField] private TMP_Text timePlayedTextComponent = null!;
        [SerializeField] private TMP_Text rewritingsTextComponent = null!;

        private readonly Pipe<string> _clickPipe = new();

        [Inject] internal ISettingsSaveSystem SettingsSaveSystem = null!;

        public Observable<string> Click => _clickPipe.Observable;

        private void OnDestroy()
        {
            _clickPipe.Dispose();
        }

        public void SetContent(IStoryStateSerializer.SaveState saveState)
        {
            roomTextComponent.text = SettingsSaveSystem.GetRoomNameFromInkValue(saveState.RoomInkName);
            timeStampTextComponent.text =
                $"{saveState.Timestamp.ToShortTimeString()} - {saveState.Timestamp.ToShortDateString()}";
            timePlayedTextComponent.text = TimeSpan.FromSeconds(saveState.NumPlayedSeconds).ToString(@"hh\:mm");
            rewritingsTextComponent.text = saveState.NumRewritings.ToString();
            _clickPipe.PipeIn(buttonComponent.OnClickAsObservable().Select(_ => saveState.Descriptor));
        }
    }
}