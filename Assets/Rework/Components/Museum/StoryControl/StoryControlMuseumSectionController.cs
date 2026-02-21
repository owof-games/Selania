using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace Selania.Rework.Components.Museum.StoryControl
{
    public class StoryControlMuseumSectionController : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] private Button simulateInteraction = null!;

        [Inject] internal IStoryLinear StoryLinear = null!;

        private void Start()
        {
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