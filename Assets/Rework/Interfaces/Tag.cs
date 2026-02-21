namespace Selania.Rework.Interfaces
{
    /// <summary>
    ///     A tag.
    /// </summary>
    /// <param name="content">The full content of a tag (e.g.: "portrait:mentore_hurry")</param>
    public record Tag(string content)
    {
        /// <summary>
        ///     The prefix of this tag. E.g.: "portrait:mentore_hurry" will return "portrait", "once" will return "once".
        /// </summary>
        public string category => content.Split(':', 2)[0].Trim();

        /// <summary>
        ///     The suffix of this tag. E.g.: "portrait:mentore_hurry" will return "mentore_hurry", "once" will return <c>null</c>.
        /// </summary>
        public string? value
        {
            get
            {
                var res = content.Split(':', 2);
                return res.Length > 1 ? res[1].Trim() : null;
            }
        }
    }
}