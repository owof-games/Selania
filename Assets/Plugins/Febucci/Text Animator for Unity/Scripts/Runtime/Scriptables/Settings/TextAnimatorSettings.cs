// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using System;
using Febucci.TextAnimatorCore.Settings;
using UnityEngine;

namespace Febucci.TextAnimatorForUnity
{
    /// <summary>
    ///     Contains global settings for Text Animator, like effects enabled status and default databases.
    /// </summary>
    [Serializable]
    [CreateAssetMenu(menuName = ScriptablePaths.SETTINGS_PATH + "Global Settings",
        fileName = "Global Settings for Text Animator")]
    public sealed class TextAnimatorSettings : ScriptableObject, ISettingsProvider<GlobalSettingsBase>
    {
        public const string expectedName = "TextAnimatorSettings";
        private static TextAnimatorSettings instance;

        [SerializeField] private UnityGlobalSettings settings;

        /// <summary>
        ///     The current instance of the settings. If it's null, it will be loaded from the resources.
        ///     (Make sure to have one "TextAnimatorSettings" file in the Resources folder.)
        /// </summary>
        public static TextAnimatorSettings Instance
        {
            get
            {
                // PSA this *can* return null

                if (instance) return instance;

                LoadSettings();
                return instance;
            }
        }

        public GlobalSettingsBase Settings => settings;

        /// <summary>
        ///     Manually loads the settings ScriptableObject in case it wasn't loaded yet.
        /// </summary>
        public static void LoadSettings()
        {
            if (instance) return;
            instance = Resources.Load<TextAnimatorSettings>(expectedName);
        }

        /// <summary>
        ///     Manually unloads the settings ScriptableObject instance.
        /// </summary>
        public static void UnloadSettings()
        {
            if (!instance) return;

            Resources.UnloadAsset(instance);
            instance = null;
        }

        /// <summary>
        ///     Sets all behaviors effects status.
        /// </summary>
        /// <param name="enabled"></param>
        public static void SetEffectsActive(bool enabled)
        {
            if (Instance) Instance.settings.isAnimatingBehaviors = enabled;
        }
    }
}