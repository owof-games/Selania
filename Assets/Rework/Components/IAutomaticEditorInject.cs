namespace Selania.Rework.Components
{
    /// <summary>
    ///     Tagging interface to put in MonoBehaviours used by <see cref="Room.ScopeUpdateAssetModificationProcessor" /> to
    ///     mark the containing gameobject as an auto-inject game object in the (only) scope found in its prefab.
    /// </summary>
    public interface IAutomaticEditorInject
    {
    }
}