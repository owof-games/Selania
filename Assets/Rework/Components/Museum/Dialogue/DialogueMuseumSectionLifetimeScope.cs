using VContainer;
using VContainer.Unity;

namespace Selania.Rework.Components.Museum.Dialogue;

public class DialogueMuseumSectionLifetimeScope : LifetimeScope
{
    protected override void Configure(IContainerBuilder builder)
    {
        builder.RegisterLogger();
    }
}