// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using System;
using Febucci.Parsing;
using Febucci.TextAnimatorCore;
using Febucci.TextAnimatorCore.BuiltIn;
using Febucci.TextAnimatorCore.Text;
using Febucci.TextAnimatorForUnity.Effects.Core;
using UnityEngine;
using UnityEngine.Scripting;
using Color32 = Febucci.Numbers.Color32;

namespace Febucci.TextAnimatorForUnity.Effects
{
    [Serializable]
    internal class Axis
    {
        public bool isEnabled;

        public AnimationCurve weight = new(
            new Keyframe(0f, 0f, 0f, 2f),
            new Keyframe(0.5f, 1f, 0f, 0f),
            new Keyframe(1f, 0f, -2f, 0f)
        );

        public Vector3 multiplier = new(1, 1, 1);
        [Range(0, 1)] public float phaseShift;

        public bool IsValid()
        {
            return isEnabled && weight != null;
        }

        public Vector3 Sample(float pct)
        {
            return weight.Evaluate((pct + phaseShift) % 1f) * multiplier;
        }
    }

    [Serializable]
    internal class ScaleAxis : Axis
    {
        public Vector3 SampleScale(float pct, float intensity)
        {
            return Vector3.LerpUnclamped(Vector3.one, Vector3.Scale(Vector3.one, multiplier),
                weight.Evaluate((pct + phaseShift) % 1f) * intensity);
        }
    }

    public enum ColorMode
    {
        SetColor,
        Multiply
    }

    [Serializable]
    internal class GradientParam
    {
        public bool isEnabled;
        public ColorMode mode = ColorMode.SetColor;

        public Gradient gradient = new()
        {
            colorKeys = new[]
            {
                new GradientColorKey(Color.white, 0),
                new GradientColorKey(Color.white, 1)
            }
        };

        [Range(0, 1)] public float phaseShift;

        public bool IsValid()
        {
            return isEnabled && gradient != null;
        }

        public Color Sample(float pct)
        {
            return gradient.Evaluate((pct + phaseShift) % 1f);
        }
    }

    [Serializable]
    internal struct CurveEffectParameters
    {
        public Axis position;
        public ScaleAxis scale;
        public Axis rotation;
        public GradientParam color;
    }

    [Serializable]
    internal struct CurveEffectState : IEffectState
    {
        private bool isRotationEnabled;
        private bool isMovementEnabled;
        private bool isScaleEnabled;
        private bool isColorEnabled;

        private CurveEffectParameters current;
        private readonly CurveEffectParameters defaultData;

        public CurveEffectState(CurveEffectParameters defaultData)
        {
            this.defaultData = defaultData;
            current = defaultData;

            isColorEnabled = defaultData.color != null && defaultData.color.IsValid();
            isMovementEnabled = defaultData.position != null && defaultData.position.IsValid();
            isRotationEnabled = defaultData.rotation != null && defaultData.rotation.IsValid();
            isScaleEnabled = defaultData.scale != null && defaultData.scale.IsValid();
        }

        public void UpdateParameters(RegionParameters parameters)
        {
            // TODO parameters
        }

        public void Apply(ref CharacterData character, in ManagedEffectContext context)
        {
            var progress = context.isInsideBehavior
                ? context.progression01
                : context.intensity;

            var intensity = context.isInsideBehavior ? context.intensity : 1;
            var modifier = context.isInsideBehavior ? 1 : context.progressionRange; // opposite dirs

            if (isRotationEnabled)
                character.RotateDegrees(current.rotation.Sample(progress).z * intensity * modifier,
                    context.isUpPositive);

            if (isMovementEnabled)
                character.MovePosition(current.position.Sample(progress) * intensity * modifier, context.isUpPositive);

            if (isScaleEnabled)
                character.Scale(current.scale.SampleScale(progress, intensity) * modifier);

            // PSA no offset on gradient!
            // this is expected, otherwise it'd be a weird effect
            if (isColorEnabled)
                switch (current.color.mode)
                {
                    case ColorMode.Multiply:
                        for (var i = 0; i < CharacterData.VERTICES_PER_CHAR; i++)
                            character.current.colors[i] =
                                Color32.LerpUnclamped(character.current.colors[i],
                                    (UnityEngine.Color32)character.current.colors[i] *
                                    current.color.Sample(progress),
                                    intensity);

                        break;
                    case ColorMode.SetColor:
                        character.LerpColor(current.color.Sample(progress), intensity);
                        break;
                }
        }
    }

    [Preserve]
    [Serializable]
    [CreateAssetMenu(menuName = ScriptablePaths.EFFECT_STATES_SPECIAL + "Curve", fileName = "Curve Effect")]
    internal sealed class CurveEffectScriptable : ManagedEffectScriptableBase
    {
        [SerializeField] private string tagID;

        [SerializeField] private EffectPresetSettings settings;
        [SerializeField] private CurveEffectContent appearance;
        [SerializeField] private CurveEffectContent persistent;
        [SerializeField] private CurveEffectContent disappearance;

        public override string TagID
        {
            get => tagID;
            set => tagID = value;
        }

        public override IEffectContent Appearance => appearance;
        public override IEffectContent Disappearance => disappearance;
        public override IEffectContent Persistent => persistent;
        public override EffectPresetSettings Settings => settings;

#if UNITY_EDITOR
        private void OnValidate()
        {
            NotifyValueChanged();
        }
#endif

        [Serializable]
        private class CurveEffectContent : IEffectContent
        {
            // defaults to linear curve to have inspector curves make sense (sampling 0->1 correctly)
            private static readonly TextAnimatorCore.BuiltIn.LinearCurve FallbackCurve = new();

            [SerializeField] private CurveEffectParameters state;
            [SerializeField] private DefaultPhaseParams phase;
            [SerializeField] private EffectPlaybackScriptableBase playback;
            [SerializeField] private EffectCurveScriptableBase curve;

            public IEffectPhase CreatePhase()
            {
                return new DefaultPhase(phase.charOffset, phase.wordOffset, phase.speed);
            }

            public IEffectState CreateState()
            {
                return new CurveEffectState(state);
            }

            public IEffectPlayback Playback => playback;
            public IEffectCurve StateCurve => curve != null ? curve : FallbackCurve;
        }
    }
}