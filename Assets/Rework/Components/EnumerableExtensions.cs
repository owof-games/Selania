using System;
using System.Collections.Generic;

namespace Selania.Rework.Components
{
    public static class EnumerableExtensions
    {
        // from https://stackoverflow.com/a/29971633
        /// <summary>
        ///     Find the index of the first occurrence of an item in a list.
        /// </summary>
        /// <param name="source">Source list.</param>
        /// <param name="predicate">Predicate that must be satisfied by the item.</param>
        /// <typeparam name="TSource">Type of the objects in the list.</typeparam>
        /// <returns>The index of the first element satisfying the predicate, or <c>-1</c> if there are none that do.</returns>
        public static int IndexOf<TSource>(this IList<TSource> source, Func<TSource, bool> predicate)
        {
            for (var i = 0; i < source.Count; i++)
                if (predicate(source[i]))
                    return i;

            return -1;
        }
    }
}