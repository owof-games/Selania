// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using System;
using Febucci.TextAnimatorCore.BuiltIn;
using UnityEngine;
using UnityEngine.Scripting;

namespace Febucci.TextAnimatorForUnity.Effects
{
    [Serializable]
    internal class PositionData
    {
        [SerializeField] public Vector3 direction = Vector3.up;
        [SerializeField] public float amplitude = 1;
    }

    [Preserve]
    [CreateAssetMenu(menuName = ScriptablePaths.EFFECT_STATES_DIRECT + "Position", fileName = "Position Effect")]
    internal sealed class PositionEffectScriptable : ManagedEffectScriptable<PositionEffectState, PositionData>
    {
        protected override PositionEffectState CreateState(PositionData parameters)
        {
            return new PositionEffectState(parameters.direction * parameters.amplitude);
        }
    }
}