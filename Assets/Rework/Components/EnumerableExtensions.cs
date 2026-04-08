using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;

namespace Selania.Rework.Components
{
    public static class EnumerableExtensions
    {
        /// <summary>
        ///     Filter out all null elements in the enumerable.
        /// </summary>
        /// <param name="enumerable">The enumerable to filter.</param>
        /// <typeparam name="T">Type of the elements in the enumerable.</typeparam>
        /// <returns>An enumerable with no nullable values.</returns>
        public static IEnumerable<T> WhereNotNull<T>(this IEnumerable<T?> enumerable)
            where T : class
        {
            return enumerable.Where(x => x != null).Cast<T>();
        }

        /// <summary>
        ///     Try finding the first element that satisfies a certain condition.
        /// </summary>
        /// <param name="enumerable">The enumerable to look into.</param>
        /// <param name="predicate">The predicate to check.</param>
        /// <param name="result">The result, if the element is found.</param>
        /// <typeparam name="T">Type of the elements.</typeparam>
        /// <returns>Whether there is an element satisfying the predicate.</returns>
        public static bool TryFirst<T>(this IEnumerable<T> enumerable, Func<T, bool> predicate,
            [NotNullWhen(true)] out T? result)
        {
            result = enumerable.FirstOrDefault(predicate);
            return result != null;
        }
    }
}