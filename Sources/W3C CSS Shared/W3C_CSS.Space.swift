//
//  W3C_CSS.Space.swift
//  swift-w3c-css
//
//  CSS coordinate space marker for typed geometry operations.
//

/// Marker type for CSS coordinate space.
///
/// CSS uses a coordinate system where:
/// - Origin (0,0) is at the top-left corner
/// - X-axis increases to the right
/// - Y-axis increases downward (same as SVG)
///
/// This space marker enables typed geometry operations that distinguish
/// between different coordinate systems.
public enum W3C_CSS {
    /// CSS coordinate space marker.
    public enum Space {}
}
