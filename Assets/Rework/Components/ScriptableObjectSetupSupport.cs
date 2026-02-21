using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace Selania.Rework.Components
{
    /// <summary>
    ///     A base class for scriptable objects that need some form of setup and cleanup for internal data structures. This
    ///     class supports both objects running in play mode and edit mode, both with domain reloading active or not.
    /// </summary>
    public abstract class ScriptableObjectSetupSupport : ScriptableObject
    {
        protected virtual void OnEnable()
        {
#if UNITY_EDITOR
            EditorApplication.playModeStateChanged += StateChanged;
#endif
            GlobalSetup();
        }

        protected virtual void OnDisable()
        {
#if UNITY_EDITOR
            EditorApplication.playModeStateChanged -= StateChanged;
#endif
            GlobalCleanup();
        }

        private void StateChanged(PlayModeStateChange playModeStateChange)
        {
            if (playModeStateChange != PlayModeStateChange.ExitingEditMode) return;
            GlobalCleanup();
            GlobalSetup();
        }

        /// <summary>
        ///     Method invoked every time there's the need to set up the scriptable object. This method should take care of
        ///     creating objects and/or initializing them.
        /// </summary>
        protected abstract void GlobalSetup();

        /// <summary>
        ///     Method invoked every time there's the need to clean up the scriptable object. This method should take care
        ///     of disposing objects and/or de-initializing them.
        /// </summary>
        protected abstract void GlobalCleanup();
    }
}