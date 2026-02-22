using Microsoft.Extensions.Logging;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components.Museum.ReaderSaveManagement
{
    public class ReaderSaveManagementMuseumSectionController : MonoBehaviour, IAutomaticEditorInject
    {
        [Inject] internal ILogger<ReaderSaveManagementMuseumSectionController> Logger = null!;
        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        public void Start()
        {
            var readerModeDescriptor = StoryStateSerializer.GetReaderModeDescriptor();
            if (readerModeDescriptor == null)
                Logger.ZLogInformation($"No reader mode slot: start new story");
            else
                Logger.ZLogInformation($"Loading slot {readerModeDescriptor}");

            StoryStateSerializer.StartStory(readerModeDescriptor);
        }
    }
}