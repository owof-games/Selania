using R3;
using Selania.Rework.Components;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    /// The interface used to provide information about a character.
    /// </summary>
    public interface IStoryRelationshipInfo
    {
        /// <summary>
        /// Get an observable for the relationship with the given character.
        /// </summary>
        /// <param name="settingsDialogueBox">The settings for the dialogue box.</param>
        /// <param name="characterName">Name of the character (see <see cref="SelaniaSettings.CharacterInfo.relationshipVariableName"/>).</param>
        /// <returns>An observable, starting with the current value, for the relationship with the given character.</returns>
        public Observable<int?> GetRelationshipLevelObservableFor(ISettingsDialogueBox settingsDialogueBox,
            string characterName);
    }
}