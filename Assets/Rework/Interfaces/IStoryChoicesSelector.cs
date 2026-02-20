using System.Collections.Generic;
using R3;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object that can pick choices.
    /// </summary>
    public interface IStoryChoicesSelector
    {
        /// <summary>
        ///     An observable emitting info about the choices whenever they change. If the last event of the story
        ///     has choices at the time of subscription, the choices will be immediately sent to the observer.
        /// </summary>
        Observable<ChoicesInfo> ChoicesObservable { get; }

        /// <summary>
        ///     Pick a choice with the given text. Newlines and whitespaces are trimmed.
        /// </summary>
        /// <param name="text">Text of the choice.</param>
        void PickChoiceWithText(string text);

        /// <summary>
        ///     Pick a choice with the given index.
        /// </summary>
        /// <param name="index">Index of the choice.</param>
        void PickChoiceWithIndex(int index);

        /// <summary>
        /// Information about the current choices.
        /// </summary>
        /// <param name="choices">the current choices.</param>
        record struct ChoicesInfo(IList<Choice> choices);

        /// <summary>
        ///     A choice.
        /// </summary>
        /// <param name="text">The text of the choice.</param>
        /// <param name="index">The index of the choice.</param>
        public record Choice(string text, int index);
    }
}