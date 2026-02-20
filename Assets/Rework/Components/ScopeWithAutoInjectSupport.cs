using System.Collections.Generic;
using UnityEngine;
using VContainer.Unity;

namespace Selania.Rework.Components
{
    public class ScopeWithAutoInjectSupport : LifetimeScope
    {
        public bool ContainsObjectInAutoInject(GameObject o)
        {
            return autoInjectGameObjects.Contains(o);
        }

        public bool AddObjectToAutoInject(GameObject o)
        {
            if (autoInjectGameObjects.Contains(o)) return false;
            autoInjectGameObjects.Add(o);
            return true;
        }

        /// <summary>
        ///     Remove all null or missing game object from auto-inject.
        /// </summary>
        public void CleanUp()
        {
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