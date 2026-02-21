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
    /// <typeparam name="TKey">Type of the dictionary keys.</typeparam>
    /// <typeparam name="TValue">Type of the dictionary values.</typeparam>
    /// <typeparam name="TEntry">Type of the entries from which key/value couples are derived.</typeparam>
    public class DerivedDictionaryProvider<TKey, TValue, TEntry>
    {
        /// <summary>
        ///     The comparer to use between entries.
        /// </summary>
        private readonly IEqualityComparer _comparer;

        /// <summary>
        ///     The function that maps entries to keys.
        /// </summary>
        private readonly Func<TEntry, TKey> _keyFunc;

        /// <summary>
        ///     The function that maps entries to values.
        /// </summary>
        private readonly Func<TEntry, TValue> _valueFunc;

        /// <summary>
        ///     The latest computation of the derived dictionary (if any).
        /// </summary>
        private IDictionary<TKey, TValue>? _dictionary;

#if UNITY_EDITOR
        /// <summary>
        ///     Only in editor mode, we hash the input values to re-compute the dictionary if needed.
        /// </summary>
        private int _lastHash;
#endif

        /// <summary>
        ///     Create a new derived dictionary.
        /// </summary>
        /// <param name="keyFunc">The function that maps entries to keys.</param>
        /// <param name="valueFunc">The function that maps entries to values.</param>
        /// <param name="comparer">A comparer for the entries, or <c>null</c> if the default comparer must be used.</param>
        public DerivedDictionaryProvider(Func<TEntry, TKey> keyFunc, Func<TEntry, TValue> valueFunc,
            IEqualityComparer? comparer = null)
        {
            _keyFunc = keyFunc;
            _valueFunc = valueFunc;
            _comparer = comparer ?? EqualityComparer<TEntry>.Default;
        }

        /// <summary>
        ///     Get the dictionary corresponding to the given set of entries. Each instance of this object should be used
        ///     with only one list of entries.
        /// </summary>
        /// <param name="entries">The entries.</param>
        /// <returns>A dictionary between keys and values, as computed by the mapping functions.</returns>
        public IDictionary<TKey, TValue> Get(TEntry[] entries)
        {
            // check if we have a valid cached dictionary, and if so, return it. 
#if UNITY_EDITOR
            var hash = ((IStructuralEquatable)entries).GetHashCode(_comparer);
#endif
            if (_dictionary != null
#if UNITY_EDITOR
                && _lastHash == hash
#endif
               )
                return _dictionary;

            // we don't have a cached dictionary: compute it, save it and return it.
            _dictionary = entries.ToDictionary(_keyFunc, _valueFunc);
#if UNITY_EDITOR
            _lastHash = hash;
#endif
            return _dictionary;
        }
    }
}