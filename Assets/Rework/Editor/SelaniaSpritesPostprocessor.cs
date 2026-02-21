using UnityEditor;
using UnityEngine;

namespace Selania.Rework.Editor
{
    /// <summary>
    ///     A sprite preprocessor that updates all the necessary settings for our sprites
    /// </summary>
    public class SelaniaSpritesPostprocessor : AssetPostprocessor
    {
        /// <summary>
        ///     Only consider assets in this directory or its subdirectories.
        /// </summary>
        private const string BasePath = "Assets/Rework";

        /// <summary>
        ///     Skip assets if their name contains this string.
        /// </summary>
        private const string SkipIfContains = "_ignore_postprocessor";

        private void OnPreprocessTexture()
        {
            // only process sprites in the right folder and with the right naming
            if (!assetPath.StartsWith(BasePath)) return;
            if (assetPath.Contains(SkipIfContains)) return;
            Debug.Log($"SelaniaSpritesPostprocessor: processing {assetPath}");

            // since we're processing textures, they use a texture importer
            var textureImporter = (TextureImporter)assetImporter;

            // default pixels per unit
            textureImporter.spritePixelsPerUnit = 1;

            // we could add more settings here
        }
    }
}