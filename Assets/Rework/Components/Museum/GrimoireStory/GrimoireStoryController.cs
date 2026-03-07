using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.GrimoireStory
{
    public class GrimoireStoryController : MonoBehaviour, IAutomaticEditorInject
    {
        [Inject] internal IStoryLinear StoryLinear = null!;

        public void Start()
        {
            StoryLinear.Continue();
        }
    }
}