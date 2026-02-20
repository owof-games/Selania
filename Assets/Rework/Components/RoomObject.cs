using System.Linq;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using ZLogger;
using Debug = System.Diagnostics.Debug;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     An object that is inside a room and gets activated / deactivated according to its presence in the room according
    ///     to Ink.
    /// </summary>
    public class RoomObject : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] [Tooltip("The name of the object in ink (list item).")]
        private string inkName = null!;

        /// <summary>
        ///     The logger used for this object.
        /// </summary>
        [Inject] internal ILogger<RoomObject> Logger = null!;

        /// <summary>
        ///     The object that provides notifications for when an object appears or disappears from the scene.
        /// </summary>
        [Inject] internal IStoryChangeRoomContentsNotifier? StoryChangeRoomContentsNotifier;

        private void Start()
        {
            Debug.Assert(StoryChangeRoomContentsNotifier != null, nameof(StoryChangeRoomContentsNotifier) + " != null");
            StoryChangeRoomContentsNotifier
                .roomContentsObservable
                .Subscribe(OnChangeRoomContents)
                .AddTo(gameObject);
        }

        private void OnChangeRoomContents(IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo info)
        {
            var isInRoom = info.roomContents.Contains(inkName);
            if (gameObject.activeSelf == isInRoom) return;
            Logger.ZLogTrace($"Changed presence of object '{inkName}' to {isInRoom}");
            gameObject.SetActive(isInRoom);
        }
    }
}