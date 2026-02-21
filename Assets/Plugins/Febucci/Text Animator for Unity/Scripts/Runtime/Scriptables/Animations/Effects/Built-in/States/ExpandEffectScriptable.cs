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
    internal class ExpandData
    {
        public ExpandType mode = ExpandType.HorizontallyFromCenter;
        public float amplitude = 1;
    }

    [Preserve]
    [CreateAssetMenu(menuName = ScriptablePaths.EFFECT_STATES_DIRECT + "Expand", fileName = "Expand Effect")]
    internal sealed class ExpandEffectScriptable : ManagedEffectScriptable<ExpandEffectState, ExpandData>
    {
        protected override ExpandEffectState CreateState(ExpandData parameters)
        {
            return new ExpandEffectState(parameters.amplitude, parameters.mode);
        }
    }
}