using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Selania.Rework.Components.Grimoire
{
    public class SecondLevelFrancoGrimoire : MonoBehaviour
    {
        [SerializeField] private TMP_Text recipeTitleTextMeshPro = null!;
        [SerializeField] private TMP_Text recipeDescriptionTextMeshPro = null!;
        [SerializeField] private TMP_Text recipeContentsTextMeshPro = null!;
        [SerializeField] private Image lockImage = null!;
        [SerializeField] private TMP_Text favourDemandedTextMeshPro = null!;

        /// <summary>
        ///     Hide the recipe and show the lock.
        /// </summary>
        public void LockRecipe()
        {
            lockImage.gameObject.SetActive(true);
            recipeTitleTextMeshPro.gameObject.SetActive(false);
            recipeDescriptionTextMeshPro.gameObject.SetActive(false);
            recipeContentsTextMeshPro.gameObject.SetActive(false);
        }

        /// <summary>
        ///     Hide the lock and show the recipe.
        /// </summary>
        /// <param name="recipeTitle">The recipe title.</param>
        /// <param name="recipeDescription">The recipe description / subtitle.</param>
        /// <param name="recipeContents">The contents of the recipe.</param>
        public void ShowRecipe(string recipeTitle, string recipeDescription, string recipeContents)
        {
            lockImage.gameObject.SetActive(false);
            recipeTitleTextMeshPro.gameObject.SetActive(true);
            recipeTitleTextMeshPro.text = recipeTitle;
            recipeDescriptionTextMeshPro.gameObject.SetActive(true);
            recipeDescriptionTextMeshPro.text = recipeDescription;
            recipeContentsTextMeshPro.gameObject.SetActive(true);
            recipeContentsTextMeshPro.text = recipeContents;
        }

        /// <summary>
        ///     Set the favor currently asked by Franco.
        /// </summary>
        /// <param name="favor">The favor asked.</param>
        public void SetFavourDemanded(string favor)
        {
            favourDemandedTextMeshPro.text = favor;
        }
    }
}