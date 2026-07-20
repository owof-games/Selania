using System;
using Cysharp.Threading.Tasks;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace Selania.Rework.Components.Museum.GrimoireNotifications
{
    public class GrimoireNotificationsController : MonoBehaviour
    {
        [SerializeField] private Button simulateInteraction = null!;
        [Inject] internal ILogger<GrimoireNotificationsController> Logger = null!;
        [Inject] internal IStoryLinear StoryLinear = null!;
        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        public void Start()
        {
            StartAsync().Forget();
        }

        private async UniTaskVoid StartAsync()
        {
            try
            {
                var found = false;
                await foreach (var saveState in StoryStateSerializer.GetSaveStates())
                {
                    await StoryStateSerializer.StartStory(saveState.Descriptor);
                    found = true;
                    break;
                }

                if (!found)
                {
                    await StoryStateSerializer.StartStory(null);
                }

                StoryLinear.conversationInProgressObservable.Subscribe(ConversationInProgress).AddTo(this);
            }
            catch (Exception e)
            {
                Logger.LogError(e, "Error while starting story");
            }
        }

        private void ConversationInProgress(bool isInProgress)
        {
            simulateInteraction.enabled = !isInProgress;
        }

        public void OnSimulateInteraction()
        {
            StoryLinear.Continue();
        }
    }
}