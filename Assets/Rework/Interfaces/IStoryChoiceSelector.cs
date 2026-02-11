namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object that can pick choices.
    /// </summary>
    public interface IStoryChoiceSelector
    {
        /// <summary>
        ///     Pick a choice with the given text. Newlines and whitespaces are trimmed.
        /// </summary>
        /// <param name="text">Text of the choice.</param>
        void PickChoiceWithText(string text);
    }
}