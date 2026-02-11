using UnityEditor;
using UnityEngine;

namespace Selania.Rework.Editor
{
    public class SelaniaSpritesPostprocessor : AssetPostprocessor
    {
        private const string BasePath = "Assets/Rework";

        private void OnPreprocessTexture()
        {
            // only process sprites in the right folder
            if (!assetPath.StartsWith(BasePath)) return;
            Debug.Log($"SelaniaSpritesPostprocessor: processing {assetPath}");

            // texture use a texture importer
            var textureImporter = (TextureImporter)assetImporter;

            // default pixels per unit
            textureImporter.spritePixelsPerUnit = 1;

            // physics shape and sprite mode (single)
            var importerSettings = new TextureImporterSettings();
            textureImporter.ReadTextureSettings(importerSettings);
            importerSettings.spriteMode = (int)SpriteImportMode.Single;
            textureImporter.SetTextureSettings(importerSettings);
        }
    }
}