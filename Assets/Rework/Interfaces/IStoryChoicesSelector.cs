using System;
using System.Collections.Generic;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object that can pick choices.
    /// </summary>
    public interface IStoryChoicesSelector
    {
        /// <summary>
        ///     Function that gets called when the choices change. The listener gets immediately called with the current
        ///     choices if there are any (even the empty set) and whenever they change.
        /// </summary>
        delegate void ChoiceChanged(IEnumerable<Choice> choices);

        /// <summary>
        ///     Add a listener for whenever the choices change.
        /// </summary>
        /// <param name="listener">The listener for the choice changed.</param>
        /// <returns>A disposable that removes the registration when disposed.</returns>
        IDisposable AddChoicesChangedListener(ChoiceChanged listener);

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
        ///     A choice.
        /// </summary>
        /// <param name="text">The text of the choice.</param>
        /// <param name="index">The index of the choice.</param>
        public record Choice(string text, int index);
    }
}