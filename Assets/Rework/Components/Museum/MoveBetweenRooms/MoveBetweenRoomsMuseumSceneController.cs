using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.MoveBetweenRooms
{
    public class MoveBetweenRoomsMuseumSceneController : MonoBehaviour, IAutomaticEditorInject
    {
        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        private void Start()
        {
            StoryStateSerializer.StartStory(null);
        }
    }
}