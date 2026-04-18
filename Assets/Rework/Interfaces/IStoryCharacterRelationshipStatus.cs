using R3;

namespace Selania.Rework.Interfaces
{
    public interface IStoryCharacterRelationshipStatus
    {
        /// <summary>
        ///     The minimum value relationships can get to.
        /// </summary>
        int minRelationshipValue { get; }

        /// <summary>
        ///     The maximum value relationships can get to.
        /// </summary>
        int maxRelationshipValue { get; }

        /// <summary>
        ///     Produce an observable that keeps updated on the relationship status with the character.
        /// </summary>
        /// <param name="characterName">Name of the character, as in ink (FirstCharacter, ...).</param>
        /// <returns>The observable of values between <see cref="minRelationshipValue" /> and <see cref="maxRelationshipValue" />.</returns>
        Observable<float> GetCharacterObservable(string characterName);
    }
}