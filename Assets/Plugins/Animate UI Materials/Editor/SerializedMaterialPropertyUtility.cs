using System;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;

namespace Plugins.Animate_UI_Materials.Editor
{
    public static class SerializedMaterialPropertyUtility
    {
        public static void AssertTypeEqual(SerializedProperty a, MaterialProperty b)
        {
            AssertTypeEqual(b, a);
        }

        public static void AssertTypeEqual(MaterialProperty a, SerializedProperty b)
        {
            switch (a.propertyType)
            {
                case ShaderPropertyType.Color when b.propertyType == SerializedPropertyType.Color: return;
                case ShaderPropertyType.Float when b.propertyType == SerializedPropertyType.Float: return;
                case ShaderPropertyType.Vector when b.propertyType == SerializedPropertyType.Vector4: return;
                case ShaderPropertyType.Range when b.propertyType == SerializedPropertyType.Float: return;
                case ShaderPropertyType.Int when b.propertyType == SerializedPropertyType.Integer: return;
                case ShaderPropertyType.Texture when b.propertyType == SerializedPropertyType.ObjectReference: return;
                case ShaderPropertyType.Texture when b.propertyType == SerializedPropertyType.Generic: return;
                default: throw new Exception("Wrong Material Override Type");
            }
        }

        public static void CopyProperty(SerializedProperty to, MaterialProperty from)
        {
            switch (from.propertyType)
            {
                case ShaderPropertyType.Color:
                    to.colorValue = from.colorValue;
                    return;
                case ShaderPropertyType.Float:
                    to.floatValue = from.floatValue;
                    return;
                case ShaderPropertyType.Vector:
                    to.vector4Value = from.vectorValue;
                    return;
                case ShaderPropertyType.Range:
                    to.floatValue = from.floatValue;
                    return;
                case ShaderPropertyType.Int:
                    to.intValue = from.intValue;
                    return;
                case ShaderPropertyType.Texture when to.propertyType == SerializedPropertyType.Generic:
                    to.FindPropertyRelative(nameof(TextureScaleOffset.ScaleOffset)).vector4Value =
                        from.textureScaleAndOffset;
                    to.FindPropertyRelative(nameof(TextureScaleOffset.Texture)).objectReferenceValue =
                        from.textureValue;
                    return;
                case ShaderPropertyType.Texture when to.propertyType == SerializedPropertyType.ObjectReference:
                    to.objectReferenceValue = from.textureValue;
                    return;
                default:
                    Debug.LogWarning($"WEIRD TYPES {to.type} {from.propertyType}");
                    return;
            }
        }

        public static void CopyProperty(MaterialProperty to, SerializedProperty from)
        {
            switch (to.propertyType)
            {
                case ShaderPropertyType.Color:
                    to.colorValue = from.colorValue;
                    return;
                case ShaderPropertyType.Float:
                    to.floatValue = from.floatValue;
                    return;
                case ShaderPropertyType.Vector:
                    to.vectorValue = from.vector4Value;
                    return;
                case ShaderPropertyType.Range:
                    to.floatValue = from.floatValue;
                    return;
                case ShaderPropertyType.Int:
                    to.intValue = from.intValue;
                    return;
                case ShaderPropertyType.Texture when from.propertyType == SerializedPropertyType.Generic:
                    to.textureScaleAndOffset =
                        from.FindPropertyRelative(nameof(TextureScaleOffset.ScaleOffset)).vector4Value;
                    to.textureValue =
                        from.FindPropertyRelative(nameof(TextureScaleOffset.Texture)).objectReferenceValue as Texture;
                    return;
                case ShaderPropertyType.Texture when from.propertyType == SerializedPropertyType.ObjectReference:
                    to.textureValue = from.objectReferenceValue as Texture;
                    return;
                default:
                    Debug.LogWarning("WEIRD TYPES");
                    return;
            }
        }
    }
}