using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.GrimoireStory
{
    public class GrimoireStoryController : MonoBehaviour, IAutomaticEditorInject
    {
        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        public void Start()
        {
            StoryStateSerializer.StartStory(null);
        }
    }
}