using System;
using System.Threading.Tasks;
using Cysharp.Threading.Tasks;
using Microsoft.Extensions.Logging;
using R3;
using Selania.Rework.Interfaces;
using UnityEngine;
using VContainer;
using VContainer.Unity;
using ZLogger;

namespace Selania.Rework.Components.Grimoire
{
    public class SecondLevelLoadScreen : MonoBehaviour, IAutomaticEditorInject
    {
        private static readonly int VisibleAnimatorProperty = Animator.StringToHash("Visible");

        [Tooltip("The prefab for the load screen buttons, with a SecondLevelLoadScreenButton component on root.")]
        [SerializeField]
        private GameObject loadScreenButtonPrefab = null!;

        [Tooltip("The container where the load screen buttons are added.")] [SerializeField]
        private Transform loadScreenButtonsContainer = null!;

        [Tooltip("The animator controller for the load screen buttons.")] [SerializeField]
        private Animator animator = null!;

        private readonly Subject<Unit> _loadCompletedObservable = new();

        private DisposableBag _disposableBag;

        [Inject] internal ILogger<SecondLevelLoadScreen> Logger = null!;

        [Inject] internal IObjectResolver ObjectResolver = null!;

        [Inject] internal IStoryStateSerializer StoryStateSerializer = null!;

        public Observable<Unit> LoadCompletedObservable => _loadCompletedObservable;

        private void OnDestroy()
        {
            _loadCompletedObservable.Dispose();
        }

        /// <summary>
        ///     Show the load screen, which will happen as soon as possible.
        /// </summary>
        public void Show()
        {
            animator.SetBool(VisibleAnimatorProperty, true);
        }

        /// <summary>
        ///     Hide the load screen, which will happen as soon as possible.
        /// </summary>
        public void Hide()
        {
            animator.SetBool(VisibleAnimatorProperty, false);
        }

        /// <summary>
        ///     Load the save files and display them as buttons. Invoked during the first frame of the "show" animation.
        /// </summary>
        private void LoadSaveFileButtons()
        {
            _disposableBag.Clear();
            LoadSaveFilesAsync().Forget();
            return;

            async UniTaskVoid LoadSaveFilesAsync()
            {
                try
                {
                    // perform the loading in any thread
                    await foreach (var saveState in StoryStateSerializer.GetSaveStates().ConfigureAwait(false))
                    {
                        // but instantiate the prefab in the main one
                        await UniTask.SwitchToMainThread();
                        var loadScreenButtonGameObject =
                            ObjectResolver.Instantiate(loadScreenButtonPrefab, loadScreenButtonsContainer);
                        var loadScreenButton = loadScreenButtonGameObject.GetComponent<SecondLevelLoadScreenButton>();
                        loadScreenButton.SetContent(saveState);
                        _disposableBag.Add(loadScreenButton.Click.Subscribe(OnLoadScreenButtonClicked));
                    }
                }
                catch (Exception e)
                {
                    Logger.ZLogError(e, $"Error while retrieving save states");
                }
            }
        }

        /// <summary>
        ///     Clear the save file buttons. Invoked during the last from of the "hide" animation.
        /// </summary>
        private void ClearSaveFileButtons()
        {
            _disposableBag.Clear();
            for (var i = 0; i < loadScreenButtonsContainer.childCount; i++)
                Destroy(loadScreenButtonsContainer.GetChild(i).gameObject);
        }

        /// <summary>
        ///     Callback when a load button is clicked.
        /// </summary>
        /// <param name="descriptor">The descriptor of the save state to load.</param>
        private void OnLoadScreenButtonClicked(string descriptor)
        {
            OnLoadScreenButtonClickedAsync().Forget();
            return;

            async UniTaskVoid OnLoadScreenButtonClickedAsync()
            {
                try
                {
                    await StoryStateSerializer.StartStory(descriptor);
                    Hide();
                    _loadCompletedObservable.OnNext(Unit.Default);
                }
                catch (Exception e)
                {
                    Logger.ZLogError(e, $"Error while loading save states");
                }
            }
        }
    }
}