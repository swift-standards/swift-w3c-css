extension Double {
    /// Formats this Double for CSS output, removing ".0" suffix for whole numbers.
    ///
    /// This is a CSS serialization convention where whole numbers should be rendered
    /// without decimal points (e.g., "45" instead of "45.0").
    ///
    /// Examples:
    /// ```swift
    /// (45.0).formattedForCSS  // "45"
    /// (45.5).formattedForCSS  // "45.5"
    /// (0.0).formattedForCSS   // "0"
    /// ```
    package var formattedForCSS: String {
        truncatingRemainder(dividingBy: 1) == 0
            ? String(Int(self))
            : String(self)
    }
}
