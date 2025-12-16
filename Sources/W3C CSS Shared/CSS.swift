//
//  CSS.swift
//  swift-w3c-css
//
//  User-facing namespace for CSS geometry types.
//
//  RECOMMENDED: Use the CSS namespace for geometry types after layout computation:
//  - CSS.Circle, CSS.Rectangle, CSS.Ellipse, CSS.Polygon, CSS.Path
//  - CSS.Point, CSS.X, CSS.Y, CSS.Width, CSS.Height
//

// Note: We don't use @_exported to avoid name collisions between
// Geometry's Length/Angle and CSS's Length/Angle types.
public import Geometry

// MARK: - CSS Namespace

/// User-facing namespace for CSS types.
///
/// Use this namespace for working with computed CSS geometry values
/// (absolute pixel values after layout resolution).
///
/// For CSS values with units/percentages before layout, use the
/// `LengthPercentage` and `BasicShape` types directly.
public enum CSS {}

// MARK: - Space Type Alias

extension CSS {
    /// CSS coordinate space geometry.
    ///
    /// All geometry types in this namespace use Double precision
    /// and are tagged with the CSS coordinate space.
    public typealias Space = Geometry<Double, W3C_CSS.Space>
}

// MARK: - Shape Type Aliases

extension CSS {
    /// A circle in CSS coordinate space.
    public typealias Circle = Space.Circle

    /// A rectangle in CSS coordinate space.
    public typealias Rectangle = Space.Rectangle

    /// An ellipse in CSS coordinate space.
    public typealias Ellipse = Space.Ellipse

    /// A line segment in CSS coordinate space.
    public typealias Line = Space.Line.Segment

    /// A polygon in CSS coordinate space.
    public typealias Polygon = Space.Polygon

    /// A path in CSS coordinate space.
    public typealias Path = Space.Path

    /// An arc in CSS coordinate space.
    public typealias Arc = Space.Arc

    /// A bezier curve in CSS coordinate space.
    public typealias Bezier = Space.Bezier

    /// A triangle in CSS coordinate space.
    public typealias Triangle = Space.Triangle
}

// MARK: - Coordinate Type Aliases

extension CSS {
    /// X coordinate in CSS space.
    public typealias X = Space.X

    /// Y coordinate in CSS space.
    public typealias Y = Space.Y

    /// X displacement in CSS space.
    public typealias Dx = Space.Dx

    /// Y displacement in CSS space.
    public typealias Dy = Space.Dy

    /// Width extent in CSS space.
    public typealias Width = Space.Width

    /// Height extent in CSS space.
    public typealias Height = Space.Height

    /// Radius in CSS space.
    public typealias Radius = Space.Radius

    /// A 2D point in CSS coordinate space.
    public typealias Point = Space.Point<2>

    /// A 2D displacement vector in CSS coordinate space.
    public typealias Vector = Space.Vector<2>
}

// MARK: - Transform Type Aliases

extension CSS {
    /// An affine transformation matrix in CSS coordinate space.
    public typealias AffineTransform = Space.AffineTransform
}

// MARK: - Edge Insets

extension CSS {
    /// Edge insets (padding/margin) in CSS coordinate space.
    public typealias EdgeInsets = Space.EdgeInsets
}
