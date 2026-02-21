// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using System;
using Febucci.TextAnimatorCore;
using Febucci.TextAnimatorCore.BuiltIn;
using Febucci.TextAnimatorForUnity.Effects.Core;
using UnityEngine;
using UnityEngine.Serialization;

namespace Febucci.TextAnimatorForUnity.Effects
{
    public abstract class ManagedEffectScriptable<TState, TStateParams> : ManagedEffectScriptable<
        TState,
        TStateParams,
        DefaultPhase,
        DefaultPhaseParams>
        where TState : struct, IEffectState
    {
        protected override DefaultPhase CreatePhase(DefaultPhaseParams parameters)
        {
            return new DefaultPhase(parameters.charOffset, parameters.wordOffset, parameters.speed);
        }
    }

    public abstract class
        ManagedEffectScriptable<TState, TStateParams, TPhase, TPhaseParams> : ManagedEffectScriptableBase
        where TState : struct, IEffectState
        where TPhase : struct, IEffectPhase
    {
        [SerializeField] private string tagId;

        [SerializeField] private EffectPresetSettings effectSettings = new()
        {
            bakeCurves = true
        };

        [SerializeField] private EffectContentWrapper appearance;

        [SerializeField] [FormerlySerializedAs("persistant")]
        private EffectContentWrapper persistent;

        [SerializeField] private EffectContentWrapper disappearance;

        // EffectPresetScriptableBase implementation
        public override IEffectContent Appearance => appearance;
        public override IEffectContent Persistent => persistent;
        public override IEffectContent Disappearance => disappearance;
        public override EffectPresetSettings Settings => effectSettings;

        public override string TagID
        {
            get => tagId;
            set => tagId = value;
        }

        private void OnEnable()
        {
            // Wire parent reference when asset loads
            if (appearance != null) appearance.parent = this;
            if (persistent != null) persistent.parent = this;
            if (disappearance != null) disappearance.parent = this;
        }

#if UNITY_EDITOR
        private void OnValidate()
        {
            // Ensure parent reference is set in editor
            OnEnable();
            NotifyValueChanged();
        }
#endif

        /// <summary>
        ///     Factory method to create the effect state from parameters.
        ///     Called for each content (Appearance/Persistant/Disappearance) with their respective parameters.
        /// </summary>
        protected abstract TState CreateState(TStateParams parameters);

        protected abstract TPhase CreatePhase(TPhaseParams parameters);

        public override void Initialize()
        {
            OnEnable();
            base.Initialize();
        }

        /// <summary>
        ///     Wrapper for effect content that combines parameters with curves/playback/phase.
        ///     Each content (Appearance/Persistant/Disappearance) has independent parameters.
        /// </summary>
        [Serializable]
        private sealed class EffectContentWrapper : IEffectContent
        {
            [SerializeField] internal TStateParams stateParams;
            [SerializeField] internal TPhaseParams phaseParams;

            [SerializeField] private EffectCurveScriptableBase stateCurve;
            [SerializeField] private EffectPlaybackScriptableBase playback;

            internal ManagedEffectScriptable<TState, TStateParams, TPhase, TPhaseParams> parent;

            // IEffectContent implementation
            public IEffectState CreateState()
            {
                return parent.CreateState(stateParams);
            }

            public IEffectCurve StateCurve => stateCurve;
            public IEffectPlayback Playback => playback;

            public IEffectPhase CreatePhase()
            {
                return parent.CreatePhase(phaseParams);
            }
        }
    }
}