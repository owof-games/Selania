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
    internal class ShearData
    {
        public HorizontalShearType horizontal = HorizontalShearType.None;
        public VerticalShearType vertical = VerticalShearType.AllSides;
        public float amplitude = 1;
    }

    [Preserve]
    [CreateAssetMenu(menuName = ScriptablePaths.EFFECT_STATES_DIRECT + "Shear", fileName = "Shear Effect")]
    internal sealed class ShearEffectScriptable : ManagedEffectScriptable<ShearEffectState, ShearData>
    {
        protected override ShearEffectState CreateState(ShearData parameters)
        {
            return new ShearEffectState(parameters.amplitude, parameters.vertical, parameters.horizontal);
        }
    }
}