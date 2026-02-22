// ReSharper disable once CheckNamespace - used to allow for required

// see https://stackoverflow.com/a/75995697

namespace System.Runtime.CompilerServices
{
    /// <summary>
    ///     Indicates that compiler support for a particular feature is required for the location where this attribute is
    ///     applied.
    /// </summary>
    [AttributeUsage(AttributeTargets.All, AllowMultiple = true, Inherited = false)]
    public sealed class CompilerFeatureRequiredAttribute : Attribute
    {
        /// <summary>
        ///     The <see cref="FeatureName" /> used for the ref structs C# feature.
        /// </summary>
        public const string RefStructs = nameof(RefStructs);

        /// <summary>
        ///     The <see cref="FeatureName" /> used for the required members C# feature.
        /// </summary>
        public const string RequiredMembers = nameof(RequiredMembers);

        public CompilerFeatureRequiredAttribute(string featureName)
        {
            FeatureName = featureName;
        }

        /// <summary>
        ///     The name of the compiler feature.
        /// </summary>
        // ReSharper disable once InconsistentNaming
        public string FeatureName { get; }

        /// <summary>
        ///     If true, the compiler can choose to allow access to the location where this attribute is applied if it does not
        ///     understand <see cref="FeatureName" />.
        /// </summary>
        // ReSharper disable once InconsistentNaming
        public bool IsOptional { get; init; }
    }
}