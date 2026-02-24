namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     A tag.
    /// </summary>
    public class Tag
    {
        /// <summary>
        ///     Create a tag.
        /// </summary>
        /// <param name="content">The full content of a tag (e.g.: "portrait:mentore_hurry")</param>
        public Tag(string content)
        {
            var parts = content.Split(':', 2);
            category = parts[0].Trim();
            value = parts.Length > 1 ? parts[1].Trim() : null;
        }

        /// <summary>
        ///     The prefix of this tag. E.g.: "portrait:mentore_hurry" will return "portrait", "once" will return "once".
        /// </summary>
        public string category { get; }

        /// <summary>
        ///     The suffix of this tag. E.g.: "portrait:mentore_hurry" will return "mentore_hurry", "once" will return <c>null</c>.
        /// </summary>
        public string? value { get; }
    }
}