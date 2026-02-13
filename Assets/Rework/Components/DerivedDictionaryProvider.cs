using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     An object that maps a list of entries to a dictionary, caching it until it changes. Changes are only admitted
    ///     in editor mode.
    /// </summary>
    /// <typeparam name="TKey"></typeparam>
    /// <typeparam name="TValue"></typeparam>
    /// <typeparam name="TEntry"></typeparam>
    public class DerivedDictionaryProvider<TKey, TValue, TEntry>
    {
        private readonly IEqualityComparer _comparer;
        private readonly Func<TEntry, TKey> _keyFunc;
        private readonly Func<TEntry, TValue> _valueFunc;
        private IDictionary<TKey, TValue>? _dictionary;
#if UNITY_EDITOR
        private int _lastHash;
#endif

        public DerivedDictionaryProvider(Func<TEntry, TKey> keyFunc, Func<TEntry, TValue> valueFunc,
            IEqualityComparer? comparer = null)
        {
            _keyFunc = keyFunc;
            _valueFunc = valueFunc;
            _comparer = comparer ?? EqualityComparer<TEntry>.Default;
        }

        public IDictionary<TKey, TValue> Get(TEntry[] entries)
        {
#if UNITY_EDITOR
            var hash = ((IStructuralEquatable)entries).GetHashCode(_comparer);
#endif
            if (_dictionary != null
#if UNITY_EDITOR
                && _lastHash == hash
#endif
               )
                return _dictionary;

            _dictionary = entries.ToDictionary(_keyFunc, _valueFunc);
#if UNITY_EDITOR
            _lastHash = hash;
#endif
            return _dictionary;
        }
    }
}