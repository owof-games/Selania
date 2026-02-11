// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using Febucci.TextAnimatorCore.Time;
using UnityEngine;

namespace Febucci.TextAnimatorForUnity
{
    public class UnityEngineProvider : IEngineProvider
    {
        public static readonly UnityEngineProvider Instance = new();

        public float GetCurrentDeltaTime(TimeScale scale)
        {
            return scale == TimeScale.Scaled ? Time.deltaTime : Time.unscaledDeltaTime;
        }
    }
}