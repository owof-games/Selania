using System;
using System.Collections.Generic;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object that handles the linear progression of the story (current text, continue story).
    /// </summary>
    public interface IStoryLinear
    {
        /// <summary>
        ///     Type of functions invoked when the current text changes.
        /// </summary>
        delegate void CurrentTextChanged(string currentText, ICollection<Tag> tags);

        /// <summary>
        ///     Whether the story can continue (there's no choice in front of it, and not the end of the story).
        /// </summary>
        public bool canContinue { get; }

        /// <summary>
        ///     Add a listener that is invoked when the current text changes, and also immediately if there's already a
        ///     current line of text.
        /// </summary>
        /// <param name="listener">The listener to invoke.</param>
        /// <returns>A disposable that removes the registration when disposed.</returns>
        IDisposable AddCurrentTextChangedListener(CurrentTextChanged listener);

        /// <summary>
        ///     Continue the current story.
        /// </summary>
        public void Continue();
    }
}