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
        [Inject] internal IStoryLinear StoryLinear = null!;
        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        public void Start()
        {
            StoryStateSerializer.StartStory(null);
            StoryLinear.conversationInProgressObservable.Subscribe(ConversationInProgress).AddTo(this);
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