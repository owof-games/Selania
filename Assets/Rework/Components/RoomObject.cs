using System.Linq;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using ZLogger;

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
        [Inject] internal IStoryChangeRoomContentsNotifier StoryChangeRoomContentsNotifier = null!;

        /// <summary>
        ///     The name of the object in ink (list item).
        /// </summary>
        public string InkName => inkName;

        private void Start()
        {
            StoryChangeRoomContentsNotifier
                .RoomContentsObservable
                .Subscribe(OnChangeRoomContents)
                .AddTo(gameObject);
        }

        /// <summary>
        ///     Method invoked whenever the contents of the room change.
        /// </summary>
        /// <param name="info">Info regarding the room contents change.</param>
        private void OnChangeRoomContents(IStoryChangeRoomContentsNotifier.ChangeRoomContentsInfo info)
        {
            var isInRoom = info.RoomContents.Contains(inkName);
            if (gameObject.activeSelf == isInRoom) return;
            Logger.ZLogTrace($"Changed presence of object '{inkName}' to {isInRoom}");
            gameObject.SetActive(isInRoom);
        }
    }
}