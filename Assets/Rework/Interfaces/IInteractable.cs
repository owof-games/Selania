using System;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object with which the user can interact (clicking over it, selecting it with the controller and pressing the
    ///     interaction button, ...).
    /// </summary>
    public interface IInteractable
    {
        /// <summary>
        ///     Function that can be called when an interactable has been interacted with.
        /// </summary>
        /// <param name="interactable">The interactable that has been interacted with.</param>
        delegate void InteractionListener(IInteractable interactable);

        /// <summary>
        ///     Add a listener that will be called when this interactable is interacted with.
        /// </summary>
        /// <param name="listener">The listener to call.</param>
        /// <returns>A disposable that removes the listener when disposed.</returns>
        IDisposable AddInteractionListener(InteractionListener listener);
    }
}