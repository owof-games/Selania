using System;
using Alchemy.Inspector;
using Cysharp.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.Museum.SaveSystem
{
    public class SaveSystemMuseumRoomController : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private RectTransform buttonsContainer = null!;

        [SerializeField] [AssetsOnly] private GameObject saveButtonPrefab = null!;

        [Inject] internal ILogger<SaveSystemMuseumRoomController> Logger = null!;

        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        private void Start()
        {
            AsyncStart().Forget();
        }

        public void StartNewStory()
        {
            StartNewStoryAsync().Forget();
        }

        private async UniTaskVoid StartNewStoryAsync()
        {
            try
            {
                await StoryStateSerializer.StartStory(null);
            }
            catch (Exception e)
            {
                Logger.ZLogError(e, $"Failed to start a new story");
            }
        }

        private async UniTaskVoid AsyncStart()
        {
            try
            {
                // fill the save buttons
                await foreach (var saveState in StoryStateSerializer.GetSaveStates())
                {
                    await UniTask.SwitchToMainThread();
                    var saveButton = Instantiate(saveButtonPrefab, buttonsContainer);
                    var textMeshProUGUI = saveButton.GetComponentInChildren<TextMeshProUGUI>();
                    textMeshProUGUI.text =
                        $"{saveState.Descriptor} - {saveState.RoomInkName} - {saveState.Timestamp:G}";
                    var button = saveButton.GetComponent<Button>();
                    button.onClick.AddListener(() => LoadSave(saveState));
                }
            }
            catch (Exception e)
            {
                Logger.ZLogError(e, $"Failed to fill save buttons list");
            }
        }

        private void LoadSave(IStoryStateSerializer.SaveState saveState)
        {
            LoadSaveAsync(saveState).Forget();
        }

        private async UniTaskVoid LoadSaveAsync(IStoryStateSerializer.SaveState saveState)
        {
            try
            {
                await StoryStateSerializer.StartStory(saveState.Descriptor);
            }
            catch (Exception e)
            {
                Logger.ZLogError(e, $"Failed to load save state with descriptor {saveState.Descriptor}");
            }
        }
    }
}