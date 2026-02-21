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
    [Serializable]
    [CreateAssetMenu(menuName = ScriptablePaths.SETTINGS_PATH + "Animator Settings",
        fileName = "Animator Settings for Text Animator")]
    public class AnimatorSettingsScriptable : ScriptableObject, ISettingsProvider<AnimatorSettings>
    {
        [SerializeField] private AnimatorSettings settings = new();
        public AnimatorSettings Settings => settings;
    }
}