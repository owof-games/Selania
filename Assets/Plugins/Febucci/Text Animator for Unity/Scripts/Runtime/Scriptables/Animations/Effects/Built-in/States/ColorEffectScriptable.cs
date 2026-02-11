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
    internal class ColorData
    {
        public TextAnimatorCore.BuiltIn.ColorMode mode = TextAnimatorCore.BuiltIn.ColorMode.Full;
        public Color color = new(1, 0, 0, 1);
    }

    [Preserve]
    [CreateAssetMenu(menuName = ScriptablePaths.EFFECT_STATES_DIRECT + "Color", fileName = "Color Effect")]
    internal sealed class ColorEffectScriptable : ManagedEffectScriptable<ColorEffectState, ColorData>
    {
        protected override ColorEffectState CreateState(ColorData parameters)
        {
            return new ColorEffectState(parameters.color, parameters.mode);
        }
    }
}