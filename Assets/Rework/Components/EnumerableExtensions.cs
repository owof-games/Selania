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

        /// <summary>
        /// An optimized version of .Select(func).ToArray() for IList that allows static time allocation.
        /// </summary>
        /// <param name="source">The source list.</param>
        /// <param name="func">The map function.</param>
        /// <typeparam name="TSource">Type of the elements in the source list.</typeparam>
        /// <typeparam name="TDest">Type of the elements in the destination array.</typeparam>
        /// <returns>An array where each corresponding element of <paramref name="source"/> has been passed through <paramref name="func"/>.</returns>
        public static TDest[] Map<TSource, TDest>(this IList<TSource> source, Func<TSource, TDest> func)
        {
            var sourceCount = source.Count;
            var destArray = new TDest[sourceCount];
            for (var i = 0; i < sourceCount; i++)
            {
                destArray[i] = func(source[i]);
            }

            return destArray;
        }
    }
}