// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using System;
using Febucci.Parsing;
using Febucci.TextAnimatorCore;
using UnityEngine;

namespace Febucci.TextAnimatorForUnity.Effects
{
    [Serializable]
    public abstract class EffectPlaybackScriptableBase : ScriptableObject, IEffectPlayback, ITagProvider
    {
        public abstract IEffectPhase Phase { get; }
        public abstract void UpdateParameters(RegionParameters parameters);
        public abstract void Initialize();
        public abstract float GetTotalDuration();
        public abstract void CalculateIntensity01(float time, out float intensity, out bool hasFinishedEffect);
        public abstract string TagID { get; }
    }
}