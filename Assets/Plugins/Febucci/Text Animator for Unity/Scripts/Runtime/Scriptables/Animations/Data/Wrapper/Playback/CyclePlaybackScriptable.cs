// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using System;
using Febucci.TextAnimatorCore;
using Febucci.TextAnimatorCore.BuiltIn;
using UnityEngine;

namespace Febucci.TextAnimatorForUnity.Effects
{
    [Serializable]
    [CreateAssetMenu(menuName = ScriptablePaths.PLAYBACKS_PATH + "Cycle", fileName = "Cycle Playback")]
    public sealed class CyclePlaybackScriptable : CoreLibraryPlaybackScriptable
    {
        [SerializeField] private CyclePlayback playback;
        protected override IEffectPlayback Playback => playback;
    }
}