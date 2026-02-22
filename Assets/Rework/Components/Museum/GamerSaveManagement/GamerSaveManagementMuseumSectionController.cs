using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using TMPro;
using UnityEngine;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.Museum.GamerSaveManagement
{
    public class GamerSaveManagementMuseumSectionController : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private TMP_Dropdown saveSlotSelectorDropDown = null!;
        [SerializeField] private TMP_Dropdown loadSlotSelectorDropDown = null!;
        [SerializeField] private TMP_Dropdown deleteSlotSelectorDropDown = null!;

        [Inject] internal ILogger<GamerSaveManagementMuseumSectionController> Logger = null!;
        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        public void StartStory()
        {
            Logger.ZLogInformation($"Starting new story");
            StoryStateSerializer.StartStory(null);
        }

        public void SaveStory()
        {
            var slot = saveSlotSelectorDropDown.value;
            Logger.ZLogInformation($"Save story in slot {slot}");
            StoryStateSerializer.Save(slot);
        }

        public void LoadStory()
        {
            var slot = loadSlotSelectorDropDown.value;
            Logger.ZLogInformation($"Load story in slot {slot}");
            var saveDescriptor = StoryStateSerializer.GetExplicitSaveDescriptor(slot);
            if (saveDescriptor == null)
                Logger.ZLogWarning($"No save in slot {slot}");
            else
                StoryStateSerializer.StartStory(saveDescriptor);
        }

        public void DeleteStory()
        {
            var slot = deleteSlotSelectorDropDown.value;
            Logger.ZLogInformation($"Delete story in slot {slot}");
            StoryStateSerializer.DeleteSave(slot);
        }
    }
}