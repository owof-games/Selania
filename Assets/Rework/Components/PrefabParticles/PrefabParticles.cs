using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using Cysharp.Threading.Tasks;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Selania.Rework.Components.PrefabParticles
{
    public class PrefabParticles : MonoBehaviour
    {
        private static readonly Dictionary<GameObject, float> AnimationDurationCache = new();

        [SerializeField] [Tooltip("The prefab to instantiate at regular intervals")]
        private GameObject? prefab;

        [SerializeField] [Tooltip("Amount of time to simulate the execution of before starting.")]
        private float prewarmTime;

        [Tooltip("The area where the prefab will be randomly spawned from.")] [SerializeField]
        private Rect spawnArea;

        [SerializeField] [Tooltip("Minimum time between successive spawns of the prefab")]
        private float minimumTimeBetweenSpawns;

        [SerializeField] [Tooltip("Maximum time between successive spawns of the prefab")]
        private float maximumTimeBetweenSpawns;

        [SerializeField] [Tooltip("The list of animator variables that must be controlled in the instantiated prefabs")]
        private AnimatorParameterDescriptor[] animatorParameterDescriptors =
            Array.Empty<AnimatorParameterDescriptor>();

        /// <summary>
        ///     The area where the prefab will be randomly spawned from.
        /// </summary>
        public Rect SpawnArea => spawnArea;


        private void Start()
        {
            // compute / read from cache the animation duration
            var animationDuration = ComputeAnimationDuration();

            // start the spawning loops
            RunAnimationLoopAsync(animationDuration, destroyCancellationToken).Forget();
        }

        private float ComputeAnimationDuration()
        {
            // no prefab: don't compute the duration
            if (prefab == null) return 0;

            // return the cached value, if any
            if (AnimationDurationCache.TryGetValue(prefab, out var duration)) return duration;

            // otherwise, compute it: if we inspect the prefab, all animator states will have length 0 (...), so we
            // have to spawn it in order to extract information from it

            // spawn the object outside visible range, just in case
            var prefabInstance = Instantiate(prefab, new Vector3(10000, 10000), Quaternion.identity);
            if (prefabInstance == null)
            {
                Debug.LogError("Cannot instantiate prefab", this);
                return 0;
            }

            // compute the clip duration
            var animator = prefabInstance.GetComponent<Animator>();
            var animatorState = animator.GetCurrentAnimatorStateInfo(0);
            duration = animatorState.length;

            // save it in cache
            AnimationDurationCache[prefab] = duration;

            // clear the spawned object
            Destroy(prefabInstance.gameObject);

            // return the result
            return duration;
        }

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
        private static void ResetAnimationDurationCache()
        {
            AnimationDurationCache.Clear();
        }

        /// <summary>
        ///     "Thread" that takes care of spawning objects.
        /// </summary>
        /// <param name="animationDuration">Duration of the prefab animation, without any speed multiplier applied.</param>
        /// <param name="cancellationToken">
        ///     The cancellation token to listen to in order to decide whether to continue with the
        ///     operations or not.
        /// </param>
        private async UniTaskVoid RunAnimationLoopAsync(float animationDuration, CancellationToken cancellationToken)
        {
            // this variable will keep info about how much time of prewarm must still be simulated.
            var remainingPrewarmTime = prewarmTime;

            // dictionary where the parameter values will be saved each loop
            Dictionary<string, float> parameterValues = new();

            try
            {
                Debug.Log("Spawn loop started", this);
                for (;;)
                {
                    // wait until the next spawn time (or consume prewarm time)
                    var spawnDelay = Random.Range(minimumTimeBetweenSpawns, maximumTimeBetweenSpawns);
                    Debug.Log($"Waiting {spawnDelay} before the next spawn");
                    if (remainingPrewarmTime > spawnDelay)
                    {
                        Debug.Log("Consuming prewarm time instead of real time");
                        remainingPrewarmTime -= spawnDelay;
                    }
                    else
                    {
                        spawnDelay -= remainingPrewarmTime;
                        if (remainingPrewarmTime > 0)
                            Debug.Log($"Consuming prewarm time instead of real time, {spawnDelay} remaining");

                        remainingPrewarmTime = 0;
                        await UniTask.Delay(TimeSpan.FromSeconds(spawnDelay), cancellationToken: cancellationToken);
                    }

                    // compute the required animator parameters
                    float speedMultiplier = 1;
                    foreach (var animatorParameterDescriptor in animatorParameterDescriptors)
                    {
                        var parameterValue = Random.Range(animatorParameterDescriptor.minimumValue,
                            animatorParameterDescriptor.maximumValue);
                        parameterValues[animatorParameterDescriptor.animatorParameterName] = parameterValue;
                        if (animatorParameterDescriptor.isSpeedMultiplier) speedMultiplier = parameterValue;
                    }

                    // compute the animation duration
                    var actualDuration = animationDuration / speedMultiplier;
                    Debug.Log(
                        $"Animation duration {animationDuration}, speed multiplier {speedMultiplier}, actual duration {actualDuration}");

                    // check if we actually have to spawn the object, or if it will be despawned by the time the prewarm
                    // is done
                    if (remainingPrewarmTime > actualDuration)
                    {
                        Debug.Log("Prewarm time will completely use up the object's duration, continue");
                        continue;
                    }

                    // pick a random spawn point
                    var spawnCoordinates = new Vector2(
                        Random.Range(spawnArea.xMin, spawnArea.xMax),
                        Random.Range(spawnArea.yMin, spawnArea.yMax)
                    );
                    Debug.Log(
                        $"Spawning at {transform.position} + {spawnCoordinates} = {transform.position + (Vector3)spawnCoordinates}");

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

                    // apply the animator parameters
                    var animator = prefabInstance.GetComponent<Animator>();
                    foreach (var parameterNameAndValue in parameterValues)
                    {
                        animator.SetFloat(parameterNameAndValue.Key, parameterNameAndValue.Value);
                    }

                    // check if we have to fast-forward the animation because of prewarm
                    if (remainingPrewarmTime > 0)
                    {
                        var animatorStateInfo = animator.GetCurrentAnimatorStateInfo(0);
                        var normalizedTime = remainingPrewarmTime / actualDuration;
                        Debug.Log($"Fast forwarding animation to normalized time {normalizedTime}");
                        animator.Play(animatorStateInfo.fullPathHash, 0, normalizedTime);
                    }

                    // decide when to despawn it and write it in the channel
                    var despawnTime = DateTime.Now + TimeSpan.FromSeconds(actualDuration - remainingPrewarmTime);
                    DespawnObjectAt(parentGameObject, despawnTime, cancellationToken).Forget();
                }
            }
            catch (OperationCanceledException)
            {
                Debug.Log("Spawn loop canceled", this);
            }
            catch (Exception e)
            {
                Debug.LogError(e.ToString(), this);
            }
        }

        private async UniTaskVoid DespawnObjectAt(GameObject gameObjectToDespawn, DateTime despawnTime,
            CancellationToken cancellationToken)
        {
            try
            {
                var delayTimeSpan = despawnTime - DateTime.Now;
                if (delayTimeSpan > TimeSpan.Zero)
                    await UniTask.Delay(delayTimeSpan, cancellationToken: cancellationToken);
            }
            catch (Exception e)
            {
                Debug.LogError(e, this);
            }
            finally
            {
                Destroy(gameObjectToDespawn);
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

            [Tooltip("Whether this parameter is the speed multiplier of the animation.")]
            public bool isSpeedMultiplier;
        }

        #region editor support

#if UNITY_EDITOR

        private readonly Color _spawnAreaGizmoColor = new(1f, 1f, 0f, 0.3f);

        private void OnDrawGizmosSelected()
        {
            Gizmos.color = _spawnAreaGizmoColor;
            Gizmos.DrawCube(transform.position + (Vector3)spawnArea.center, spawnArea.size);
        }

        private void OnDrawGizmos()
        {
            Gizmos.color = _spawnAreaGizmoColor;
            var center = transform.position + (Vector3)spawnArea.center;
            var dx = new Vector3(spawnArea.size.x / 2, 0f, 0);
            var dy = new Vector3(0f, spawnArea.size.y / 2, 0);
            Gizmos.DrawLine(center - dx - dy, center - dx + dy);
            Gizmos.DrawLine(center - dx + dy, center + dx + dy);
            Gizmos.DrawLine(center + dx + dy, center + dx - dy);
            Gizmos.DrawLine(center + dx - dy, center - dx - dy);
        }

        public IEnumerable<string> GetValidationErrors()
        {
            if (!prefab)
            {
                yield return "No prefab set for this PrefabParticles";
            }
            else
            {
                var animator = prefab.gameObject.GetComponent<Animator>();
                if (!animator) yield return "No animator component in prefab";
            }

            if (minimumTimeBetweenSpawns <= 0f)
                yield return "Minimum time between spawns must be greater than zero.";

            if (maximumTimeBetweenSpawns <= 0f)
                yield return "Maximum time between spawns must be greater than zero.";

            if (maximumTimeBetweenSpawns < minimumTimeBetweenSpawns)
                yield return "Maximum time between spawns must be greater than the minimum time.";

            var i = 1;
            foreach (var descriptor in animatorParameterDescriptors)
            {
                if (string.IsNullOrEmpty(descriptor.animatorParameterName))
                {
                    yield return $"Animator variable {i} has no name";
                }
                else if (prefab)
                {
                    var animator = prefab.GetComponent<Animator>();
                    var parameter = animator.parameters.FirstOrDefault(parameter =>
                        parameter.name == descriptor.animatorParameterName);
                    if (parameter == null)
                        yield return
                            $"Animator variable {i} has animator parameter {descriptor.animatorParameterName}, but that parameter does not exist in the animator of the prefab.";
                    else if (parameter.type != AnimatorControllerParameterType.Float)
                        yield return
                            $"Animator variable {i} has animator parameter {descriptor.animatorParameterName}, but that parameter is of type {parameter.type} instead of being a float.";
                }

                if (descriptor.maximumValue < descriptor.minimumValue)
                    yield return
                        $"Animator variable {i} ({descriptor.animatorParameterName}) has a maximum value lower than the minimum value";

                i++;
            }

            if (animatorParameterDescriptors.Count(descriptor => descriptor.isSpeedMultiplier) > 1)
                yield return "Only one animator parameter should be marked as speed multiplier.";
        }

#endif

        #endregion
    }
}