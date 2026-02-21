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
    internal class RandomPositionData
    {
        public float amplitude = 1;
        public bool progressIndexWithTime;
    }

    [Preserve]
    [CreateAssetMenu(menuName = ScriptablePaths.EFFECT_STATES_DIRECT + "Random Position",
        fileName = "Random Position Effect")]
    internal sealed class RandomPositionEffect : ManagedEffectScriptable<RandomPositionEffectState, RandomPositionData>
    {
        protected override RandomPositionEffectState CreateState(RandomPositionData parameters)
        {
            return new RandomPositionEffectState(parameters.amplitude, parameters.progressIndexWithTime);
        }
    }
}