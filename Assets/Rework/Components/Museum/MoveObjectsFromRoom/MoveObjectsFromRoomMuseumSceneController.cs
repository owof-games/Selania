using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;

namespace Selania.Rework.Components.Museum.MoveObjectsFromRoom
{
    public class MoveObjectsFromRoomMuseumSceneController : MonoBehaviour, IAutomaticEditorInject
    {
        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        private void Start()
        {
            StoryStateSerializer.StartStory(null);
        }
    }
}