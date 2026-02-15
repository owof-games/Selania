using UnityEditor;
using UnityEngine;

namespace Selania.Rework.Editor
{
    public class SelaniaSpritesPostprocessor : AssetPostprocessor
    {
        private const string BasePath = "Assets/Rework";
        private const string SkipIfContains = "_ignore_postprocessor";

        private void OnPreprocessTexture()
        {
            // only process sprites in the right folder
            if (!assetPath.StartsWith(BasePath)) return;
            if (assetPath.Contains(SkipIfContains)) return;
            Debug.Log($"SelaniaSpritesPostprocessor: processing {assetPath}");

            // texture use a texture importer
            var textureImporter = (TextureImporter)assetImporter;

            // default pixels per unit
            textureImporter.spritePixelsPerUnit = 1;
        }
    }
}