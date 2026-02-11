// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using UnityEngine;
using UnityEngine.Scripting;

namespace Febucci.TextAnimatorForUnity.Effects
{
    [Preserve]
    [CreateAssetMenu(menuName = ScriptablePaths.CURVE_PATH + "Step", fileName = "Step Curve")]
    public sealed class StepCurve : CoreLibraryCurveScriptableBase<TextAnimatorCore.BuiltIn.StepCurve>
    {
    }
}