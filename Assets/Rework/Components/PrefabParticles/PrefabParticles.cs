using System;
using System.Linq;
using Alchemy.Inspector;
using UnityEngine;

namespace Selania.Rework.Components.PrefabParticles
{
    public class PrefabParticles : MonoBehaviour
    {
        [SerializeField] [Tooltip("The prefab to instantiate at regular intervals")]
        private GameObject? prefab;

        [Tooltip("The area where the prefab will be randomly spawned from.")] [SerializeField]
        private Rect spawnArea;

        [SerializeField] [Tooltip("Minimum time between successive spawns of the prefab")]
        private float minimumTimeBetweenSpawns;

        [SerializeField] [Tooltip("Maximum time between successive spawns of the prefab")]
        private float maximumTimeBetweenSpawns;

        [SerializeField] [Tooltip("The list of animator variables that must be controlled in the instantiated prefabs")]
        private AnimatorVariableDescriptor[] animatorVariableDescriptors = Array.Empty<AnimatorVariableDescriptor>();

        private readonly Color _spawnAreaGizmoColor = new(1f, 1f, 0f, 0.5f);

        [Serializable]
        private class AnimatorVariableDescriptor
        {
            [Tooltip(
                "Name of the (number) animator variable in the animator of the prefab to change once the prefab is instantiated.")]
            public string animatorVariableName = "";

            [Tooltip("Minimum value of the animator variable.")]
            public float minimumValue;

            [Tooltip("Maximum value of the animator variable.")]
            public float maximumValue = 1;
        }

        #region editor support

        private void OnDrawGizmosSelected()
        {
            Gizmos.color = _spawnAreaGizmoColor;
            Gizmos.DrawCube(transform.position + (Vector3)spawnArea.center, spawnArea.size);
        }

        private void OnDrawGizmos()
        {
            Gizmos.color = _spawnAreaGizmoColor;
            Gizmos.DrawWireCube(transform.position + (Vector3)spawnArea.center, spawnArea.size);
        }

        private void OnValidate()
        {
            if (prefab == null)
            {
                Debug.LogError("No prefab set for this PrefabParticles", this);
            }
            else
            {
                var animator = prefab.gameObject.GetComponent<Animator>();
                if (animator == null) Debug.LogError("No animator component in prefab");
            }

            if (minimumTimeBetweenSpawns <= 0f)
                Debug.LogError("Minimum time between spawns must be greater than zero.", this);

            if (maximumTimeBetweenSpawns <= 0f)
                Debug.LogError("Maximum time between spawns must be greater than zero.", this);

            if (maximumTimeBetweenSpawns < minimumTimeBetweenSpawns)
                Debug.LogError("Maximum time between spawns must be greater than the minimum time.", this);

            var i = 1;
            foreach (var descriptor in animatorVariableDescriptors)
            {
                if (string.IsNullOrEmpty(descriptor.animatorVariableName))
                {
                    Debug.LogError($"Animator variable {i} has no name", this);
                }
                else if (prefab != null)
                {
                    var animator = prefab.GetComponent<Animator>();
                    var parameter = animator.parameters.FirstOrDefault(parameter =>
                        parameter.name == descriptor.animatorVariableName);
                    if (parameter == null)
                        Debug.LogError(
                            $"Animator variable {i} has animator parameter {descriptor.animatorVariableName}, but that parameter does not exist in the animator of the prefab.",
                            this);
                    else if (parameter.type != AnimatorControllerParameterType.Float)
                        Debug.LogError(
                            $"Animator variable {i} has animator parameter {descriptor.animatorVariableName}, but that parameter is of type {parameter.type} instead of being a float.",
                            this);
                }

                if (descriptor.maximumValue < descriptor.minimumValue)
                    Debug.LogError($"Animator variable {i} has a maximum value less than the minimum value", this);

                i++;
            }
        }

        [Button]
        // ReSharper disable once UnusedMember.Local - used as a Button
        private void Validate()
        {
            OnValidate();
        }

        #endregion
    }
}