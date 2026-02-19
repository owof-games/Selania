using System.Collections.Generic;
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
            StoryLinear.AddConversationEndedListener(ConversationEnded).DisposeWith(gameObject);
            StoryLinear.AddCurrentTextChangedListener(CurrentTextChanged).DisposeWith(gameObject);
        }

        private void CurrentTextChanged(string currentText, ICollection<Tag> tags)
        {
            simulateInteraction.enabled = false;
        }

        private void ConversationEnded()
        {
            simulateInteraction.enabled = true;
        }

        public void OnSimulateInteraction()
        {
            StoryLinear.Continue();
        }
    }
}