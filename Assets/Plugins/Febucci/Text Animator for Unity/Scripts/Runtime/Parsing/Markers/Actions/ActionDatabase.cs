// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using System;
using System.Collections.Generic;
using Febucci.TextAnimatorCore.Data;
using Febucci.TextAnimatorCore.Typing;
using Febucci.TextAnimatorForUnity.Actions.Core;
using UnityEngine;

namespace Febucci.TextAnimatorForUnity.Actions
{
    [Serializable]
    [CreateAssetMenu(fileName = "ActionDatabase", menuName = ScriptablePaths.ACTIONS_PATH + "Create Actions Database",
        order = 100)]
    public class ActionDatabase : Database<ActionScriptableBase>, IDatabaseProvider<ITypewriterAction>
    {
        private Dictionary<string, ITypewriterAction> converted = new();

        public override bool IsCaseSensitive => false;

        public Dictionary<string, ITypewriterAction> Database
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
            converted = new Dictionary<string, ITypewriterAction>();
            foreach (var pair in Dictionary)
                converted.Add(pair.Key, pair.Value);
        }
    }
}