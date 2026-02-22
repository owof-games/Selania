using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     The (temporary) controller of the main scene to start a new story when the scene is loaded.
    /// </summary>
    public class MainSceneController : MonoBehaviour, IAutomaticEditorInject
    {
        /// <summary>
        ///     The part of the story manager that handles serialization (start new, start from savefile, etc)
        /// </summary>
        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        private void Start()
        {
            // start the story as soon as the scene is loaded
            StoryStateSerializer.StartStory(null);
        }
    }
}