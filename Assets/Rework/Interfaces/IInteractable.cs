using R3;

namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     An object with which the user can interact (clicking over it, selecting it with the controller and pressing the
    ///     interaction button, ...).
    /// </summary>
    public interface IInteractable
    {
        /// <summary>
        /// An observable that notifies when an interactable gets interacted with.
        /// </summary>
        Observable<IInteractable> interactionObservable { get; }
    }
}