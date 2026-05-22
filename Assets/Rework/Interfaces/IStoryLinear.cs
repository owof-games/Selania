using R3;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object that handles the linear progression of the story (current text, continue story).
    /// </summary>
    public interface IStoryLinear
    {
        /// <summary>
        ///     Whether the story can continue (there's no choice in front of it, and not the end of the story).
        /// </summary>
        public bool canContinue { get; }

        /// <summary>
        ///     An observable producing information about the current text. Observers will immediately receive the current
        ///     text information, if any.
        /// </summary>
        Observable<CurrentTextInfo> currentTextObservable { get; }

        /// <summary>
        ///     An observable producing sprite names that must be shown in the dialogue.
        /// </summary>
        Observable<string> imageObservable { get; }

        /// <summary>
        ///     An observable that emits whether there is a conversation going on or not.
        /// </summary>
        Observable<bool> conversationInProgressObservable { get; }

        /// <summary>
        ///     Continue the current story.
        /// </summary>
        public void Continue();

        /// <summary>
        ///     Information about current text changes.
        /// </summary>
        /// <param name="currentText">The current text as a string.</param>
        record struct CurrentTextInfo(string currentText);
    }
}