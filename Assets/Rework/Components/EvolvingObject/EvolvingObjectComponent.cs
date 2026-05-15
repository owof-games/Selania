using System;
using System.Linq;
using LitMotion;
using LitMotion.Extensions;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using ZLogger;

namespace Selania.Rework.Components
{
    [RequireComponent(typeof(RoomObject))]
    public class EvolvingObjectComponent : MonoBehaviour, IAutomaticEditorInject
    {
        [SerializeField] [Tooltip("Ink variable name (number) that contains the state of the object")]
        private string inkVariableName = null!;

        [SerializeField] [Tooltip("Definition of the sprites to use for the various possible values of the variable")]
        private SpriteDefinition[] spriteDefinitions = Array.Empty<SpriteDefinition>();

        [SerializeField]
        [Tooltip("The game object where the sprite renderer is situated. This object will be cloned at runtime.")]
        private GameObject spriteGameObject = null!;

        /// <summary>
        ///     A transparent color (as white, so the cross-fade to white works).
        /// </summary>
        private readonly Color _transparentColor = new(1, 1, 1, 0);

        [Inject] internal ILogger<EvolvingObjectComponent> Logger = null!;

        [Inject] internal IRoomContentMemory RoomContentMemory = null!;

        [Inject] internal IStoryChangeRoomContentsNotifier StoryChangeRoomContentsNotifier = null!;

        [Inject] internal IStoryVariableValues StoryVariableValues = null!;

        private void Start()
        {
            // get the room object components
            var roomObject = GetComponent<RoomObject>();
            var objectName = roomObject.InkName;

            // get the sprite renderer
            var originalSpriteRenderer = spriteGameObject.GetComponent<SpriteRenderer>();

            var clonedSpriteGameObject = Instantiate(spriteGameObject, transform);
            var clonedSpriteRenderer = clonedSpriteGameObject.GetComponent<SpriteRenderer>();
            clonedSpriteRenderer.color = _transparentColor;

            // whenever the variable changes, look for the corresponding sprite
            var usingOriginalSpriteRenderer = true;
            StoryVariableValues
                // listen to changes in the ink variable we track
                .GetVariableObservable<int>(inkVariableName)
                // find the sprite corresponding to the given value
                .CombineLatest(StoryChangeRoomContentsNotifier.RoomContentsObservable, (state, roomContents) =>
                {
                    var spriteDefinition = spriteDefinitions.FirstOrDefault(definition => definition.value == state);
                    if (spriteDefinition == null)
                        Logger.ZLogWarning($"Cannot find sprite definition of {gameObject.name} for value {state}");
                    var currentRoomName = roomContents.CurrentRoomName;
                    var previousState = RoomContentMemory.GetPreviousState(currentRoomName, objectName);
                    var previousSpriteDefinition =
                        spriteDefinitions.FirstOrDefault(definition => definition.value == previousState);
                    return (State: state, Sprite: spriteDefinition?.sprite, CurrentRoomName: currentRoomName,
                        PreviousSprite: previousSpriteDefinition?.sprite);
                })
                .DistinctUntilChangedBy(state => state.State)
                // subscribe to changes (and await sequentially the animations, so that they are queued one after the other)
                .SubscribeAwait(async (data, cancellationToken) =>
                {
                    // if we saw this object for the first time, or it didn't change state since last time, we don't need
                    // to perform a cross-fade, just show it.
                    var currentSpriteRenderer =
                        usingOriginalSpriteRenderer ? originalSpriteRenderer : clonedSpriteRenderer;
                    var previousState = RoomContentMemory.GetPreviousState(data.CurrentRoomName, objectName);
                    RoomContentMemory.SetState(data.CurrentRoomName, objectName, data.State);
                    if (previousState == null || data.State == previousState)
                    {
                        Logger.ZLogTrace(
                            $"Changing state to {data.State} (previous recorded state was {previousState} in room {data.CurrentRoomName}), and because of this an immediate sprite-switch is performed.");
                        currentSpriteRenderer.sprite = data.Sprite;
                        return;
                    }

                    // if not, find the current sprite renderer to fade out, and the target to fade in
                    Logger.ZLogTrace(
                        $"Changing state to {data.State} (previous recorded state was {previousState} in room {data.CurrentRoomName}), and because of this a cross-fade is performed.");
                    var targetSpriteRenderer =
                        usingOriginalSpriteRenderer ? clonedSpriteRenderer : originalSpriteRenderer;
                    currentSpriteRenderer.sprite = data.PreviousSprite;
                    targetSpriteRenderer.sprite = data.Sprite;
                    usingOriginalSpriteRenderer = !usingOriginalSpriteRenderer;

                    // animate both fades to create a cross-fade, and wait for it to complete
                    await LSequence.Create()
                        .Join(LMotion.Create(targetSpriteRenderer.color, Color.white, 1)
                            .BindToColor(targetSpriteRenderer))
                        .Join(LMotion.Create(currentSpriteRenderer.color, _transparentColor, 1)
                            .BindToColor(currentSpriteRenderer))
                        .Run()
                        .ToValueTask(cancellationToken);

                    Logger.ZLogTrace($"Animation completed ({previousState} => {data.State}).");
                })
                .AddTo(this);
        }

        [Serializable]
        public class SpriteDefinition
        {
            public int value;
            public Sprite? sprite;
        }
    }
}