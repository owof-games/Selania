// =======================================================
// Text Animator for Unity - Copyright (c) 2018-Today, Febucci SRL, febucci.com
// - LICENSE: https://www.textanimatorforgames.com/legal/eula
// - DOCUMENTATION: https://docs.febucci.com/text-animator-unity/
// - WEBSITE: https://www.textanimatorforgames.com/
// =======================================================

using System;
using Febucci.Parsing;
using Febucci.TextAnimatorCore;
using Febucci.TextAnimatorCore.Text;

namespace Febucci.TextAnimatorForUnity
{
    public class UnityEffectBase : IEffectState
    {
        public void UpdateParameters(RegionParameters parameters)
        {
            throw new NotImplementedException();
        }

        public void Apply(ref CharacterData character, in ManagedEffectContext context)
        {
            throw new NotImplementedException();
        }
    }
}