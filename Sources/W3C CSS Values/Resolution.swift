import Foundation

/// Represents a CSS resolution value.
///
/// The `Resolution` type denotes the pixel density of an output device. Resolution values
/// are commonly used in media queries to target devices with specific pixel densities,
/// such as high-DPI displays.
///
/// Example:
/// ```swift
/// @media print and (min-resolution: \(Resolution.dpi(300)))  // @media print and (min-resolution: 300dpi)
/// @media (resolution: \(Resolution.dpcm(120)))               // @media (resolution: 120dpcm)
/// @media (min-resolution: \(Resolution.dppx(2)))             // @media (min-resolution: 2dppx)
/// ```
///
/// - Note: On screens, the units are related to CSS inches, centimeters, or pixels, not physical values.
///
/// - SeeAlso: [MDN Web Docs on resolution](https://developer.mozilla.org/en-US/docs/Web/CSS/resolution)
public struct Resolution: Sendable, Hashable {
    /// Errors that can occur when creating a Resolution
    public enum ResolutionError: Error, Sendable {
        case invalidValue(String)
    }

    /// Represents the resolution unit (dpi, dpcm, dppx, x)
    public enum Unit: String, Sendable, Hashable {
        /// Dots per inch (1dpi ≈ 0.39dpcm)
        case dpi

        /// Dots per centimeter (1dpcm ≈ 2.54dpi)
        case dpcm

        /// Dots per px unit (1dppx = 96dpi)
        case dppx

        /// Alias for dppx
        case x
    }

    /// The numeric value of the resolution
    public let value: Double

    /// The unit of the resolution
    public let unit: Unit

    /// Creates a new CSS resolution value
    /// - Parameters:
    ///   - value: The numeric value (must be non-negative)
    ///   - unit: The resolution unit
    /// - Throws: `ResolutionError.invalidValue` if the value is negative
    public init(_ value: Double, unit: Unit) throws {
        guard value >= 0 else {
            throw ResolutionError.invalidValue("Resolution value must be non-negative, got \(value)")
        }
        self.value = value
        self.unit = unit
    }

    /// Creates a resolution in dots per inch (dpi)
    /// - Parameter value: The dpi value (must be non-negative)
    /// - Returns: A resolution value in dpi
    /// - Throws: `ResolutionError.invalidValue` if the value is negative
    public static func dpi(_ value: Double) throws -> Resolution {
        return try Resolution(value, unit: .dpi)
    }

    /// Creates a resolution in dots per centimeter (dpcm)
    /// - Parameter value: The dpcm value (must be non-negative)
    /// - Returns: A resolution value in dpcm
    /// - Throws: `ResolutionError.invalidValue` if the value is negative
    public static func dpcm(_ value: Double) throws -> Resolution {
        return try Resolution(value, unit: .dpcm)
    }

    /// Creates a resolution in dots per px unit (dppx)
    /// - Parameter value: The dppx value (must be non-negative)
    /// - Returns: A resolution value in dppx
    /// - Throws: `ResolutionError.invalidValue` if the value is negative
    public static func dppx(_ value: Double) throws -> Resolution {
        return try Resolution(value, unit: .dppx)
    }

    /// Creates a resolution in x units (alias for dppx)
    /// - Parameter value: The x value (must be non-negative)
    /// - Returns: A resolution value in x units
    /// - Throws: `ResolutionError.invalidValue` if the value is negative
    public static func x(_ value: Double) throws -> Resolution {
        return try Resolution(value, unit: .x)
    }

    /// Converts the resolution to different units
    /// - Parameter targetUnit: The unit to convert to
    /// - Returns: A new resolution in the requested unit with an equivalent value
    public func converted(to targetUnit: Unit) -> Resolution {
        if unit == targetUnit {
            return self
        }

        // First convert to dpi as the common intermediate unit
        let dpiValue: Double
        switch unit {
        case .dpi:
            dpiValue = value
        case .dpcm:
            dpiValue = value * 2.54  // 1 dpcm = 2.54 dpi
        case .dppx, .x:
            dpiValue = value * 96  // 1 dppx = 96 dpi
        }

        // Then convert from dpi to the target unit
        // Note: These won't throw since we're converting from a valid positive value
        switch targetUnit {
        case .dpi:
            return try! Resolution(dpiValue, unit: .dpi)
        case .dpcm:
            return try! Resolution(dpiValue / 2.54, unit: .dpcm)
        case .dppx:
            return try! Resolution(dpiValue / 96, unit: .dppx)
        case .x:
            return try! Resolution(dpiValue / 96, unit: .x)
        }
    }

    /// Standard screen resolution (96dpi, 1dppx)
    public static let standard = try! Resolution.dpi(96)

    /// High-DPI (Retina) resolution (192dpi, 2dppx)
    public static let retina = try! Resolution.dpi(192)

    /// Common print resolution (300dpi)
    public static let print = try! Resolution.dpi(300)
}

/// Provides string conversion for CSS output
extension Resolution: CustomStringConvertible {
    /// Converts the resolution to its CSS string representation
    public var description: String {
        return "\(value.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(value)) : String(value))\(unit.rawValue)"
    }
}
