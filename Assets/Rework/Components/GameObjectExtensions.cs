using System;
using Cysharp.Threading.Tasks;
using UnityEngine;

namespace Selania.Rework.Components
{
    public static class GameObjectExtensions
    {
        /// <summary>
        ///     Dispose the <see cref="IDisposable" /> when the given game object is destroyed.
        /// </summary>
        /// <param name="disposable">The disposable to dispose.</param>
        /// <param name="gameObject">The game object to look for the disposal of.</param>
        public static void DisposeWith(this IDisposable disposable, GameObject gameObject)
        {
            gameObject.GetCancellationTokenOnDestroy().Register(disposable.Dispose);
        }
    }
}