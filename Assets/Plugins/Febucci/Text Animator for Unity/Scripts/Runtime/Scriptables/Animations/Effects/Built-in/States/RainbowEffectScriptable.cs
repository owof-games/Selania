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
    internal class RainbowData
    {
    }

    [Preserve]
    [CreateAssetMenu(menuName = ScriptablePaths.EFFECT_STATES_DIRECT + "Rainbow", fileName = "Rainbow Effect")]
    internal sealed class RainbowEffectScriptable : ManagedEffectScriptable<RainbowColorEffectState, RainbowData>
    {
        protected override RainbowColorEffectState CreateState(RainbowData parameters)
        {
            return new RainbowColorEffectState(true);
        }
    }
}