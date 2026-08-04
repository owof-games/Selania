using System.Collections.Generic;
using System.Text;

namespace Selania.Rework.Components
{
    public class TagsPrinter
    {
        private readonly IList<string>? _tags;

        public TagsPrinter(IList<string>? tags)
        {
            _tags = tags;
        }

        public override string ToString()
        {
            if (_tags == null) return string.Empty;

            var sb = new StringBuilder();
            var first = true;
            foreach (var tag in _tags)
            {
                if (first)
                {
                    sb.Append('#');
                }
                else
                {
                    sb.Append(" #");
                }

                sb.Append(tag);
                first = false;
            }

            return sb.ToString();
        }
    }
}