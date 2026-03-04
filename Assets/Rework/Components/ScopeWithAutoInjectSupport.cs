using System.Collections.Generic;
using UnityEngine;
using VContainer.Unity;

namespace Selania.Rework.Components
{
    /// <summary>
    ///     A VContainer scope that exposes functionalities to set up its auto-inject objects.
    /// </summary>
    public class ScopeWithAutoInjectSupport : LifetimeScope
    {
        /// <summary>
        ///     Whether a game object is already in its list of auto-inject objects.
        /// </summary>
        /// <param name="o">The object to check.</param>
        /// <returns><c>true</c> if the object is already in the list of auto-inject objects, false otherwise.</returns>
        public bool ContainsObjectInAutoInject(GameObject o)
        {
            return autoInjectGameObjects != null && autoInjectGameObjects.Contains(o);
        }

        /// <summary>
        ///     Add a game object to the auto-inject list, if not already present.
        /// </summary>
        /// <param name="o">The object to add.</param>
        /// <returns><c>true</c> if the object was added, or <c>false</c> if it was already present.</returns>
        public bool AddObjectToAutoInject(GameObject o)
        {
            if (ContainsObjectInAutoInject(o)) return false;
            autoInjectGameObjects ??= new List<GameObject>();
            autoInjectGameObjects.Add(o);
            return true;
        }

        /// <summary>
        ///     Remove all null or missing game objects from the auto-inject list.
        /// </summary>
        public void CleanUp()
        {
            // the list of indices to remove, from the biggest to the smallest, or null if we find no indices to remove
            List<int>? toRemove = null;

            if (autoInjectGameObjects == null) return;

            for (var i = autoInjectGameObjects.Count - 1; i >= 0; i--)
            {
                if (autoInjectGameObjects[i] != null) continue;
                toRemove ??= new List<int>();
                toRemove.Add(i);
            }

            if (toRemove == null) return;
            foreach (var i in toRemove) autoInjectGameObjects.RemoveAt(i);
        }
    }
}