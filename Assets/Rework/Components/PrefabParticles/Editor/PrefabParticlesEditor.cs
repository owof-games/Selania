using System;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Selania.Rework.Components.PrefabParticles.Editor
{
    [CustomEditor(typeof(PrefabParticles))]
    public class PrefabParticlesEditor : UnityEditor.Editor
    {
        private SerializedProperty? _animatorParameterDescriptorsProperty;

        private GUIStyle? _errorLabelGuiStyle;
        private SerializedProperty? _maximumTimeBetweenSpawnsProperty;
        private SerializedProperty? _minimumTimeBetweenSpawnsProperty;
        private PrefabParticles? _prefabParticles;
        private SerializedProperty? _prefabProperty;
        private SerializedProperty? _prewarmTimeProperty;
        private SerializedProperty? _spawnAreaProperty;

        private void OnEnable()
        {
            // find the target object
            var prefabParticles = target as PrefabParticles;
            if (prefabParticles == null)
                throw new InvalidOperationException("Target of PrefabParticlesEditor is not a PrefabParticles");
            _prefabParticles = prefabParticles;

            // create the serialized properties
            _prefabProperty = serializedObject.FindProperty("prefab");
            _prewarmTimeProperty = serializedObject.FindProperty("prewarmTime");
            _spawnAreaProperty = serializedObject.FindProperty("spawnArea");
            _minimumTimeBetweenSpawnsProperty = serializedObject.FindProperty("minimumTimeBetweenSpawns");
            _maximumTimeBetweenSpawnsProperty = serializedObject.FindProperty("maximumTimeBetweenSpawns");
            _animatorParameterDescriptorsProperty = serializedObject.FindProperty("animatorParameterDescriptors");

            // set up styles
            _errorLabelGuiStyle ??= new GUIStyle
            {
                wordWrap = true,
                normal = new GUIStyleState
                {
                    textColor = Color.indianRed
                }
            };
        }

        private void OnDisable()
        {
            _prefabProperty?.Dispose();
            _prewarmTimeProperty?.Dispose();
            _spawnAreaProperty?.Dispose();
            _minimumTimeBetweenSpawnsProperty?.Dispose();
            _maximumTimeBetweenSpawnsProperty?.Dispose();
            _animatorParameterDescriptorsProperty?.Dispose();
        }

        private void OnSceneGUI()
        {
            // skip if for some reason it's not enabled
            if (_prefabParticles == null || _spawnAreaProperty == null) return;

            // compute the coordinates of the four corners
            var center = _prefabParticles.transform.position;

            var xMin = center.x + _prefabParticles.SpawnArea.xMin;
            var yMin = center.x + _prefabParticles.SpawnArea.yMin;
            var xMax = center.y + _prefabParticles.SpawnArea.xMax;
            var yMax = center.y + _prefabParticles.SpawnArea.yMax;

            var bottomLeft = new Vector3(xMin, yMin, 0);
            var bottomRight = new Vector3(xMax, yMin, 0);
            var topLeft = new Vector3(xMin, yMax, 0);
            var topRight = new Vector3(xMax, yMax, 0);

            // flag to check whether we should actually perform a change
            var changed = false;

            // for each corner, create a handle and check changes
            EditorGUI.BeginChangeCheck();
            var newBottomLeft = Handles.FreeMoveHandle(bottomLeft, 10, Vector3.one * 0.5f, Handles.RectangleHandleCap);
            if (EditorGUI.EndChangeCheck())
            {
                xMin = newBottomLeft.x;
                yMin = newBottomLeft.y;
                changed = true;
            }

            EditorGUI.BeginChangeCheck();
            var newBottomRight =
                Handles.FreeMoveHandle(bottomRight, 10, Vector3.one * 0.5f, Handles.RectangleHandleCap);
            if (EditorGUI.EndChangeCheck())
            {
                xMax = newBottomRight.x;
                yMin = newBottomRight.y;
                changed = true;
            }

            EditorGUI.BeginChangeCheck();
            var newTopLeft = Handles.FreeMoveHandle(topLeft, 10, Vector3.one * 0.5f, Handles.RectangleHandleCap);
            if (EditorGUI.EndChangeCheck())
            {
                xMin = newTopLeft.x;
                yMax = newTopLeft.y;
                changed = true;
            }

            EditorGUI.BeginChangeCheck();
            var newTopRight = Handles.FreeMoveHandle(topRight, 10, Vector3.one * 0.5f, Handles.RectangleHandleCap);
            if (EditorGUI.EndChangeCheck())
            {
                xMax = newTopRight.x;
                yMax = newTopRight.y;
                changed = true;
            }

            // if there was a change to apply, do it through serialized object
            if (!changed) return;
            _spawnAreaProperty.rectValue = new Rect(xMin, yMin, xMax - xMin, yMax - yMin);
            serializedObject.ApplyModifiedProperties();
        }

        public override void OnInspectorGUI()
        {
            serializedObject.Update();
            EditorGUILayout.PropertyField(_prefabProperty);
            EditorGUILayout.PropertyField(_prewarmTimeProperty);
            EditorGUILayout.PropertyField(_spawnAreaProperty);
            EditorGUILayout.PropertyField(_minimumTimeBetweenSpawnsProperty);
            EditorGUILayout.PropertyField(_maximumTimeBetweenSpawnsProperty);
            EditorGUILayout.PropertyField(_animatorParameterDescriptorsProperty);

            foreach (var validationError in _prefabParticles?.GetValidationErrors() ?? Enumerable.Empty<string>())
                EditorGUILayout.LabelField(validationError, _errorLabelGuiStyle);

            serializedObject.ApplyModifiedProperties();
        }
    }
}