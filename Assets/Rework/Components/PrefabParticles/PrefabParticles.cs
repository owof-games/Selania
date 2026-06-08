using System;
using System.Linq;
using System.Threading;
using Alchemy.Inspector;
using Cysharp.Threading.Tasks;
using UnityEngine;
using Random = UnityEngine.Random;

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
        private AnimatorParameterDescriptor[] animatorParameterDescriptors =
            Array.Empty<AnimatorParameterDescriptor>();

        private void Start()
        {
            var objectsToDespawnChannel = Channel.CreateSingleConsumerUnbounded<ObjectToDespawn>();
            RunAnimationLoopAsync(objectsToDespawnChannel, destroyCancellationToken).Forget();
            DespawnObjectsLoopAsync(objectsToDespawnChannel, destroyCancellationToken).Forget();
        }

        /// <summary>
        ///     "Thread" that takes care of spawning objects.
        /// </summary>
        /// <param name="objectsToDespawnChannel">Channel where to write info about the despawn of objects.</param>
        /// <param name="cancellationToken">
        ///     The cancellation token to listen to in order to decide whether to continue with the
        ///     operations or not.
        /// </param>
        private async UniTaskVoid RunAnimationLoopAsync(Channel<ObjectToDespawn> objectsToDespawnChannel,
            CancellationToken cancellationToken)
        {
            try
            {
                Debug.Log("Spawn loop started", this);
                for (;;)
                {
                    // wait until the next spawn time
                    var spawnDelay = Random.Range(minimumTimeBetweenSpawns, maximumTimeBetweenSpawns);
                    await UniTask.Delay(TimeSpan.FromSeconds(spawnDelay), cancellationToken: cancellationToken);

                    // pick a random spawn point
                    var spawnCoordinates = new Vector2(
                        Random.Range(spawnArea.xMin, spawnArea.xMax),
                        Random.Range(spawnArea.yMin, spawnArea.yMax)
                    );

                    // spawn the parent at that location
                    var parentGameObject = new GameObject
                    {
                        transform =
                        {
                            parent = transform,
                            position = transform.position + (Vector3)spawnCoordinates
                        }
                    };

                    // spawn the object
                    var prefabInstance = Instantiate(prefab, parentGameObject.transform);
                    if (prefabInstance == null)
                    {
                        Debug.LogError("Cannot instantiate prefab", this);
                        continue;
                    }

                    // set the required animator parameters
                    var animator = prefabInstance.GetComponent<Animator>();
                    foreach (var animatorParameterDescriptor in animatorParameterDescriptors)
                    {
                        var parameterValue = Random.Range(animatorParameterDescriptor.minimumValue,
                            animatorParameterDescriptor.maximumValue);
                        animator.SetFloat(animatorParameterDescriptor.animatorParameterName, parameterValue);
                    }

                    // wait a frame to let the animation start
                    await UniTask.NextFrame();

                    // decide when to despawn it and write it in the channel
                    var animatorState = animator.GetCurrentAnimatorStateInfo(0);
                    var actualDuration = animatorState.length * animatorState.speed;
                    var despawnTime = DateTime.Now + TimeSpan.FromSeconds(actualDuration);
                    var writeSucceeded =
                        objectsToDespawnChannel.Writer.TryWrite(new ObjectToDespawn(despawnTime, parentGameObject));
                    if (writeSucceeded) continue;
                    Debug.LogError(
                        $"Could not write that an object had to be despawned at {despawnTime}, doing it immediately");
                    Destroy(parentGameObject);
                }
            }
            catch (OperationCanceledException)
            {
                objectsToDespawnChannel.Writer.TryComplete();
                Debug.Log("Spawn loop canceled", this);
            }
            catch (Exception e)
            {
                objectsToDespawnChannel.Writer.TryComplete(e);
                Debug.LogError(e.ToString(), this);
            }
        }

        /// <summary>
        ///     "Thread" that takes care of despawning objects.
        /// </summary>
        /// <param name="objectsToDespawnChannel">Channel where to read info about the objects to despawn.</param>
        /// <param name="cancellationToken">
        ///     The cancellation token to listen to in order to decide whether to continue with the
        ///     operations or not.
        /// </param>
        private async UniTaskVoid DespawnObjectsLoopAsync(Channel<ObjectToDespawn> objectsToDespawnChannel,
            CancellationToken cancellationToken)
        {
            try
            {
                Debug.Log("Despawn loop started", this);
                for (;;)
                    await foreach (var objectToDespawn in objectsToDespawnChannel.Reader.ReadAllAsync()
                                       .WithCancellation(cancellationToken))
                    {
                        var now = DateTime.Now;
                        if (objectToDespawn.DespawnTime > now)
                            await UniTask.Delay(objectToDespawn.DespawnTime - now,
                                cancellationToken: cancellationToken);

                        await UniTask.SwitchToMainThread();
                        Destroy(objectToDespawn.GameObject);
                    }
            }
            catch (OperationCanceledException)
            {
                Debug.Log("Despawn loop canceled", this);
            }
            catch (Exception e)
            {
                Debug.LogError(e.ToString(), this);
            }
            finally
            {
                // make sure to despawn all pending game objects
                while (objectsToDespawnChannel.Reader.TryRead(out var objectToDespawn))
                    Destroy(objectToDespawn.GameObject);
            }
        }

        [Serializable]
        private class AnimatorParameterDescriptor
        {
            [Tooltip(
                "Name of the (number) animator variable in the animator of the prefab to change once the prefab is instantiated.")]
            public string animatorParameterName = "";

            [Tooltip("Minimum value of the animator variable.")]
            public float minimumValue;

            [Tooltip("Maximum value of the animator variable.")]
            public float maximumValue = 1;
        }

        /// <summary>
        ///     Description of an object to despawn.
        /// </summary>
        /// <param name="DespawnTime">Time at which the object must be despawned.</param>
        /// <param name="GameObject">Game object to despawn.</param>
        private record ObjectToDespawn(DateTime DespawnTime, GameObject GameObject);

        #region editor support

#if UNITY_EDITOR

        private readonly Color _spawnAreaGizmoColor = new(1f, 1f, 0f, 0.5f);

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
            foreach (var descriptor in animatorParameterDescriptors)
            {
                if (string.IsNullOrEmpty(descriptor.animatorParameterName))
                {
                    Debug.LogError($"Animator variable {i} has no name", this);
                }
                else if (prefab != null)
                {
                    var animator = prefab.GetComponent<Animator>();
                    var parameter = animator.parameters.FirstOrDefault(parameter =>
                        parameter.name == descriptor.animatorParameterName);
                    if (parameter == null)
                        Debug.LogError(
                            $"Animator variable {i} has animator parameter {descriptor.animatorParameterName}, but that parameter does not exist in the animator of the prefab.",
                            this);
                    else if (parameter.type != AnimatorControllerParameterType.Float)
                        Debug.LogError(
                            $"Animator variable {i} has animator parameter {descriptor.animatorParameterName}, but that parameter is of type {parameter.type} instead of being a float.",
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

#endif

        #endregion
    }
}