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
    public abstract class CoreLibraryPlaybackScriptable : EffectPlaybackScriptableBase
    {
        [SerializeField] private string tagID;

        private IEffectPlayback playback;
        public override string TagID => tagID;
        protected abstract IEffectPlayback Playback { get; }
        public override IEffectPhase Phase { get; }

        private void OnEnable()
        {
        }

        public override void UpdateParameters(RegionParameters parameters)
        {
            playback?.UpdateParameters(parameters);
        }

        public override void Initialize()
        {
            playback = Playback; // gets once

            if (playback == null)
                throw new NullReferenceException($"Playback is null in {name}");

            playback.Initialize();
        }

        public override float GetTotalDuration()
        {
            return playback?.GetTotalDuration() ?? 0;
        }

        public override void CalculateIntensity01(float time, out float intensity, out bool hasFinishedEffect)
        {
            if (playback != null)
            {
                playback.CalculateIntensity01(time, out intensity, out hasFinishedEffect);
            }
            else
            {
                intensity = 0;
                hasFinishedEffect = true;
            }
        }
    }
}