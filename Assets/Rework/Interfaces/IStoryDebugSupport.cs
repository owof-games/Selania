namespace Selania.Rework.Interfaces
{
    public interface IStoryDebugSupport
    {
        /// <summary>
        ///     Get the list of all the choices present at the given debug knot.
        /// </summary>
        /// <returns>The choices available at the debug.</returns>
        public DebugKnotChoice[]? GetDebugKnotChoices(string debugKnot);

        /// <summary>
        ///     Pick a debug knot choice and return its text content.
        /// </summary>
        /// <param name="debugKnotChoice">The choice to pick.</param>
        /// <returns>The text content of the debug knot choice when picked.</returns>
        public string PickDebugKnotChoice(DebugKnotChoice debugKnotChoice);

        /// <summary>
        ///     The choice in a debug knot.
        /// </summary>
        /// <param name="DebugKnot">The debug knot where this choice was situated.</param>
        /// <param name="ChoiceIndex">Index of the choice.</param>
        /// <param name="Text">Text of the choice.</param>
        record DebugKnotChoice(string DebugKnot, int ChoiceIndex, string Text);
    }
}