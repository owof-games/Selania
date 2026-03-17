using System.Collections.Generic;
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
    }
}