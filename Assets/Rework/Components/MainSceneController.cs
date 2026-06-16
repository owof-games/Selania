using System;
using Cysharp.Threading.Tasks;
using Microsoft.Extensions.Logging;
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
        ///     The logger for this controller.
        /// </summary>
        [Inject] internal ILogger<MainSceneController> Logger = null!;

        /// <summary>
        ///     The part of the story manager that handles serialization (start new, start from savefile, etc)
        /// </summary>
        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        private void Start()
        {
            StartAsync().Forget();
        }

        private async UniTaskVoid StartAsync()
        {
            try
            {
                // first check if there's at least one save: if so, load it and return
                await foreach (var saveState in StoryStateSerializer.GetSaveStates())
                {
                    await StoryStateSerializer.StartStory(saveState.Descriptor);
                    return;
                }

                // otherwise, start the story as soon as the scene is loaded
                await StoryStateSerializer.StartStory(null);
            }
            catch (Exception e)
            {
                Logger.LogError(e, "Error while trying to load the latest save or starting the game.");
            }
        }
    }
}