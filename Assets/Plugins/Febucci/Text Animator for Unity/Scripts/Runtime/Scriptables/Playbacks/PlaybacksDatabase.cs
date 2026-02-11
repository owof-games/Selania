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
using Febucci.TextAnimatorForUnity.Effects;
using UnityEngine;

namespace Febucci.TextAnimatorForUnity
{
    [Serializable]
    [CreateAssetMenu(fileName = "Playbacks Database",
        menuName = ScriptablePaths.PLAYBACKS_PATH + "Create Playbacks Database", order = 100)]
    public class PlaybacksDatabase : Database<EffectPlaybackScriptableBase>, IDatabaseProvider<IEffectPlayback>
    {
        private Dictionary<string, IEffectPlayback> converted;
        public override bool IsCaseSensitive => false;

        public Dictionary<string, IEffectPlayback> Database
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
            converted = new Dictionary<string, IEffectPlayback>();
            foreach (var pair in Dictionary)
                converted.Add(pair.Key, pair.Value);
        }
    }
}