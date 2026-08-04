using System.Collections.Generic;
using System.Linq;
using Ink;

namespace Selania.Rework.Interfaces
{
    public interface IStoryCodeExecutor
    {
        ExecutionResult Execute(string expression);

        public record ExecutionResult(string? Error, string? Output)
        {
            public ExecutionResult(string? Error, string? output, List<(string, ErrorType)> extraErrors)
                : this(ComputeError(Error, extraErrors), output)
            {
            }

            private static string? ComputeError(string? baseError, List<(string, ErrorType)> extraErrors)
            {
                var actualErrors = extraErrors.Where(e => e.Item2 >= ErrorType.Error).ToArray();
                if (actualErrors.Length <= 0) return baseError;

                var error = string.Join("\n", actualErrors.Select(e => e.Item1));
                error += baseError ?? "";
                return error;
            }
        }
    }
}