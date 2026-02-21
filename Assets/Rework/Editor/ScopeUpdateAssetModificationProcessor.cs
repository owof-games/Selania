using System.Linq;
using Selania.Rework.Components;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using VContainer.Unity;

namespace Selania.Rework.Editor
{
    /// <summary>
    ///     An asset modification processor that adds components implementing the <see cref="IAutomaticEditorInject" />
    ///     tagging interface to the <see cref="ScopeWithAutoInjectSupport" /> found in a prefab when the prefab is saved (by default: at
    ///     every change).
    /// </summary>
    public class ScopeUpdateAssetModificationProcessor : AssetModificationProcessor
    {
        private static string[] OnWillSaveAssets(string[] paths)
        {
            // check that we're editing a prefab.
            if (!paths.Any(path => path.EndsWith(".prefab"))) return paths;
            Debug.Log("Processing scope updates in current prefab.");

            // since we're editing a prefab, this should always return a stage, but you never know
            var stage = PrefabStageUtility.GetCurrentPrefabStage();
            if (stage == null)
            {
                Debug.Log("Not in prefab stage");
            }
            else
            {
                // get the room scope
                var roomScope = stage.prefabContentsRoot.GetComponentInChildren<ScopeWithAutoInjectSupport>();
                if (roomScope == null)
                    // no room scope to update
                    return paths;

                // clean the room scope of old/unused objects
                roomScope.CleanUp();

                // process the objects marked with IAutomaticEditorInject
                var automaticEditorInjects = stage.prefabContentsRoot.GetComponentsInChildren<IAutomaticEditorInject>();
                foreach (var automaticEditorInject in automaticEditorInjects)
                {
                    if (automaticEditorInject is not Component component)
                    {
                        Debug.LogWarning(
                            $"Found an object that implements {nameof(IAutomaticEditorInject)} but is not a component");
                        continue;
                    }

                    // only take into consideration objects that are not prefabs with their lifetime scope on their
                    // own
                    var gameObject = component.gameObject;
                    var prefabRoot = PrefabUtility.GetNearestPrefabInstanceRoot(gameObject);
                    if (prefabRoot != null)
                        if (prefabRoot.GetComponentInChildren<LifetimeScope>() != null)
                        {
                            Debug.Log($"{gameObject.name} has its own lifetime scope");
                            continue;
                        }

                    // the object passed all the tests: add the corresponding game object to the room scope
                    AddToRoomScope(roomScope, component.gameObject);
                }
            }

            return paths;
        }

        private static void AddToRoomScope(ScopeWithAutoInjectSupport scopeWithAutoInjectSupport, GameObject gameObject)
        {
            // see https://discussions.unity.com/t/findobjectoftype-in-preview-scene/799531/2
            if (!EditorSceneManager.IsPreviewSceneObject(gameObject))
            {
                Debug.Log($"{gameObject.name} is not a preview scene object");
                return;
            }

            if (scopeWithAutoInjectSupport == null)
                // No room scope found
                return;

            // don't add the same game object multiple times
            if (scopeWithAutoInjectSupport.ContainsObjectInAutoInject(gameObject)) return;

            Debug.Log($"Adding to scope '{scopeWithAutoInjectSupport.name}'", gameObject);

            Undo.RecordObject(scopeWithAutoInjectSupport, $"Adding {gameObject.name} to auto-injected objects");
            if (scopeWithAutoInjectSupport.AddObjectToAutoInject(gameObject))
                Debug.Log($"Added {gameObject.name} to auto-injected objects in {scopeWithAutoInjectSupport.name}",
                    gameObject);
        }
    }
}