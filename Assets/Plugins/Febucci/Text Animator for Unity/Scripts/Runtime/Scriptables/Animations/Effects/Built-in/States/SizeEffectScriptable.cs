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
    internal class SizeData
    {
        public Vector3 scale = Vector3.one;
    }

    [Preserve]
    [CreateAssetMenu(menuName = ScriptablePaths.EFFECT_STATES_DIRECT + "Scale", fileName = "Scale Effect")]
    internal sealed class SizeEffectScriptable : ManagedEffectScriptable<SizeEffectState, SizeData>
    {
        protected override SizeEffectState CreateState(SizeData parameters)
        {
            return new SizeEffectState(parameters.scale);
        }
    }
}