// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using System;
using System.Collections.Generic;
using Febucci.TextAnimatorCore;
using Febucci.TextAnimatorCore.Data;
using Febucci.TextAnimatorForUnity.Effects.Core;
using UnityEngine;

namespace Febucci.TextAnimatorForUnity
{
    /// <summary>
    ///     Contains animations that will be recognized and used by Text Animator
    /// </summary>
    [Serializable]
    [CreateAssetMenu(fileName = "Animations Database",
        menuName = ScriptablePaths.EFFECT_STATES_PATH + "Create Animations Database", order = 100)]
    public class AnimationsDatabase : Database<EffectScriptableBase>, IDatabaseProvider<IEffect>
    {
        private Dictionary<string, IEffect> converted;
        public override bool IsCaseSensitive => false;

        public Dictionary<string, IEffect> Database
        {
            get
            {
                BuildOnce();
                return converted;
            }
        }

        protected override void OnBuildOnce()
        {
            base.OnBuildOnce();
            converted = new Dictionary<string, IEffect>();
            foreach (var pair in Dictionary)
                converted.Add(pair.Key, pair.Value);
        }
    }
}