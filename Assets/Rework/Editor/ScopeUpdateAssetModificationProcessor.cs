using System.Linq;
using Selania.Rework.Components;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

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
            if (!paths.Any(path => path.EndsWith(".prefab"))) return paths;
            Debug.Log("Processing scope updates in current prefab.");

            var stage = PrefabStageUtility.GetCurrentPrefabStage();
            if (stage == null)
            {
                Debug.Log("Not in prefab stage");
            }
            else
            {
                // get the room scope out
                var roomScope = stage.prefabContentsRoot.GetComponentInChildren<ScopeWithAutoInjectSupport>();
                if (roomScope == null)
                    // no room scope to update
                    return paths;

                // clean the room scope of old/unused objects
                roomScope.CleanUp();

                var automaticEditorInjects = stage.prefabContentsRoot.GetComponentsInChildren<IAutomaticEditorInject>();
                foreach (var automaticEditorInject in automaticEditorInjects)
                {
                    if (automaticEditorInject is not Component component)
                    {
                        Debug.LogWarning(
                            $"Found an object that implements {nameof(IAutomaticEditorInject)} but is not a component");
                        continue;
                    }

                    // only take into consideration objects that belong to this prefab
                    var gameObject = component.gameObject;
                    if (PrefabUtility.GetNearestPrefabInstanceRoot(gameObject) != null) continue;
                    AddToRoomScope(roomScope, component.gameObject);
                }
            }

            return paths;
        }

        private static void AddToRoomScope(ScopeWithAutoInjectSupport scopeWithAutoInjectSupport, GameObject gameObject)
        {
            // see https://discussions.unity.com/t/findobjectoftype-in-preview-scene/799531/2
            // thanks for saving us from the insanity of unity editor system
            if (!EditorSceneManager.IsPreviewSceneObject(gameObject))
            {
                Debug.Log($"{gameObject.name} is not a preview scene object");
                return;
            }

            if (scopeWithAutoInjectSupport == null)
                // Debug.Log("No room scope found.", this);
                return;

            if (scopeWithAutoInjectSupport.ContainsObjectInAutoInject(gameObject)) return;

            Debug.Log($"Adding to scope '{scopeWithAutoInjectSupport.name}'", gameObject);

            Undo.RecordObject(scopeWithAutoInjectSupport, $"Adding {gameObject.name} to auto-injected objects");
            if (scopeWithAutoInjectSupport.AddObjectToAutoInject(gameObject))
                Debug.Log($"Added {gameObject.name} to auto-injected objects in {scopeWithAutoInjectSupport.name}",
                    gameObject);
        }
    }
}