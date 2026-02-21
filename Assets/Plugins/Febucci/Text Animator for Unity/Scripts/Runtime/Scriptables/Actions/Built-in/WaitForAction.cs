// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using System;
using System.Globalization;
using Febucci.TextAnimatorCore.Typing;
using Febucci.TextAnimatorCore.Typing.BuiltIn;
using Febucci.TextAnimatorForUnity.Actions.Core;
using UnityEngine;

namespace Febucci.TextAnimatorForUnity.Actions
{
    [Serializable]
    [CreateAssetMenu(menuName = ScriptablePaths.ACTIONS_PATH + "Wait For Seconds",
        fileName = "Wait For Seconds Action")]
    [TagInfo("waitfor")]
    internal sealed class WaitForAction : CoreLibraryActionScriptableWrapper<WaitForActionState>
    {
        /// <summary>
        ///     Time used in case the action does not have the first parameter
        /// </summary>
        [Tooltip("Time used in case the action does not have the first parameter")]
        public float defaultTime = 1;

        protected override WaitForActionState CreateState(ActionMarker marker, object typewriter)
        {
            var waitDuration = 1f;
            if (marker.parameters != null && marker.parameters.Length > 0)
                if (!float.TryParse(marker.parameters[0], NumberStyles.Float,
                        CultureInfo.InvariantCulture, out waitDuration))
                    waitDuration = defaultTime;

            return new WaitForActionState(waitDuration);
        }
    }
}