// Dimension Tests.swift
// swift-w3c-css
//
// Tests for CSS GenericDimension type

import Testing

@testable import W3C_CSS_Values

// MARK: - Basic Functionality

@Suite
struct `GenericDimension - Double Initialization` {
    @Test(arguments: [
        (20.5, "px", "20.5px"),
        (1.75, "em", "1.75em"),
        (50.0, "%", "50%"),
        (2.25, "cm", "2.25cm"),
        (3.75, "rem", "3.75rem"),
    ])
    func `initializer creates proper instances with double values`(
        value: Double,
        unit: String,
        expected: String
    ) {
        let dimension = GenericDimension(value, unit: unit)
        #expect(dimension.value == value)
        #expect(dimension.unit == unit)
        #expect(dimension.description == expected)
    }
}

@Suite
struct `GenericDimension - Int Initialization` {
    @Test(arguments: [
        (20, "px", "20px"),
        (2, "em", "2em"),
        (100, "vw", "100vw"),
        (5, "q", "5q"),
    ])
    func `initializer creates proper instances with int values`(
        value: Int,
        unit: String,
        expected: String
    ) {
        let dimension = GenericDimension(value, unit: unit)
        #expect(dimension.value == Double(value))
        #expect(dimension.unit == unit)
        #expect(dimension.description == expected)
    }
}

@Suite
struct `GenericDimension - Truncating Remainder` {
    @Test func `integer values do not show decimal point`() {
        let dimension = GenericDimension(10, unit: "px")
        #expect(dimension.description == "10px")
    }

    @Test func `values with decimals show decimals`() {
        let dimension = GenericDimension(10.5, unit: "em")
        #expect(dimension.description == "10.5em")
    }

    @Test func `values with trailing zeros truncate them`() {
        let dimension = GenericDimension(15.0, unit: "vh")
        #expect(dimension.description == "15vh")
    }

    @Test func `small decimal values work correctly`() {
        let dimension = GenericDimension(0.25, unit: "em")
        #expect(dimension.description == "0.25em")
    }
}

// MARK: - Protocol Conformance

@Suite
struct `GenericDimension - Hashable Conformance` {
    @Test func `same values and units are equal`() {
        let dim1 = GenericDimension(10, unit: "px")
        let dim2 = GenericDimension(10, unit: "px")
        #expect(dim1 == dim2)
    }

    @Test func `different values are not equal`() {
        let dim1 = GenericDimension(10, unit: "px")
        let dim3 = GenericDimension(20, unit: "px")
        #expect(dim1 != dim3)
    }

    @Test func `different units are not equal even with same value`() {
        let dim1 = GenericDimension(10, unit: "px")
        let dim4 = GenericDimension(10, unit: "em")
        #expect(dim1 != dim4)
    }

    @Test func `double and int with same value are equal`() {
        let dim1 = GenericDimension(10, unit: "px")
        let dim5 = GenericDimension(10.0, unit: "px")
        #expect(dim1 == dim5)
    }
}

// MARK: - CSS Dimension Units

@Suite
struct `GenericDimension - Absolute Length Units` {
    @Test(arguments: [
        (10.0, "px", "10px"),
        (1.0, "cm", "1cm"),
        (10.0, "mm", "10mm"),
        (1.0, "in", "1in"),
        (10.0, "pt", "10pt"),
        (2.0, "pc", "2pc"),
    ])
    func `absolute length units render correctly`(
        value: Double,
        unit: String,
        expected: String
    ) {
        let dimension = GenericDimension(value, unit: unit)
        #expect(dimension.description == expected)
    }
}

@Suite
struct `GenericDimension - Relative Length Units` {
    @Test(arguments: [
        (1.5, "em", "1.5em"),
        (2.0, "rem", "2rem"),
        (8.0, "ex", "8ex"),
        (20.0, "ch", "20ch"),
        (50.0, "vw", "50vw"),
        (75.0, "vh", "75vh"),
        (80.0, "vmin", "80vmin"),
        (90.0, "vmax", "90vmax"),
    ])
    func `relative length units render correctly`(
        value: Double,
        unit: String,
        expected: String
    ) {
        let dimension = GenericDimension(value, unit: unit)
        #expect(dimension.description == expected)
    }
}

@Suite
struct `GenericDimension - Time Units` {
    @Test(arguments: [
        (2.0, "s", "2s"),
        (500.0, "ms", "500ms"),
    ])
    func `time units render correctly`(
        value: Double,
        unit: String,
        expected: String
    ) {
        let dimension = GenericDimension(value, unit: unit)
        #expect(dimension.description == expected)
    }
}

@Suite
struct `GenericDimension - Frequency Units` {
    @Test(arguments: [
        (44100.0, "Hz", "44100Hz"),
        (15.0, "kHz", "15kHz"),
    ])
    func `frequency units render correctly`(
        value: Double,
        unit: String,
        expected: String
    ) {
        let dimension = GenericDimension(value, unit: unit)
        #expect(dimension.description == expected)
    }
}

@Suite
struct `GenericDimension - Resolution Units` {
    @Test(arguments: [
        (300.0, "dpi", "300dpi"),
        (2.0, "dpcm", "2dpcm"),
        (96.0, "dppx", "96dppx"),
    ])
    func `resolution units render correctly`(
        value: Double,
        unit: String,
        expected: String
    ) {
        let dimension = GenericDimension(value, unit: unit)
        #expect(dimension.description == expected)
    }
}

@Suite
struct `GenericDimension - Percentage Unit` {
    @Test func `percentage unit renders correctly`() {
        let dimension = GenericDimension(42, unit: "%")
        #expect(dimension.description == "42%")
    }
}

// MARK: - Usage in Context

@Suite
struct `GenericDimension - CSS Property Usage` {
    @Test func `dimension renders correctly in width property`() {
        let width = "width: \(GenericDimension(200, unit: "px"))"
        #expect(width == "width: 200px")
    }

    @Test func `dimension renders correctly in margin property`() {
        let margin = "margin: \(GenericDimension(1.5, unit: "rem"))"
        #expect(margin == "margin: 1.5rem")
    }

    @Test func `dimension renders correctly in multiple contexts`() {
        let combined =
            "padding: \(GenericDimension(10, unit: "px")) \(GenericDimension(20, unit: "px"))"
        #expect(combined == "padding: 10px 20px")
    }

    @Test func `percentage dimension renders correctly`() {
        let percentage = "width: \(GenericDimension(75, unit: "%"))"
        #expect(percentage == "width: 75%")
    }
}

// MARK: - Edge Cases

@Suite
struct `GenericDimension - Edge Cases` {
    @Test func `zero values render correctly`() {
        #expect(GenericDimension(0, unit: "px").description == "0px")
        #expect(GenericDimension(0.0, unit: "em").description == "0em")
    }

    @Test func `negative values render correctly`() {
        #expect(GenericDimension(-10, unit: "px").description == "-10px")
        #expect(GenericDimension(-1.5, unit: "em").description == "-1.5em")
    }

    @Test func `very small values preserve precision`() {
        #expect(GenericDimension(0.001, unit: "px").description == "0.001px")
        #expect(GenericDimension(0.0001, unit: "em").description == "0.0001em")
    }

    @Test func `very large values render correctly`() {
        #expect(GenericDimension(999999, unit: "px").description == "999999px")
        #expect(GenericDimension(1_000_000, unit: "em").description == "1000000em")
    }

    @Test func `decimal precision is maintained`() {
        #expect(GenericDimension(10.123456, unit: "px").description == "10.123456px")
    }
}

// MARK: - Performance

extension `Performance Tests` {
    @Suite
    struct `GenericDimension - Performance` {
        @Test(.timeLimit(.minutes(1)))
        func `dimension creation 100K times`() {
            for i in 0..<100_000 {
                _ = GenericDimension(Double(i), unit: "px")
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `dimension comparison 100K times`() {
            let dim1 = GenericDimension(50, unit: "px")
            for i in 0..<100_000 {
                _ = GenericDimension(Double(i), unit: "px") == dim1
            }
        }

        @Test(.timeLimit(.minutes(1)))
        func `dimension with various units 100K times`() {
            let units = ["px", "em", "rem", "vw", "vh", "%"]
            for i in 0..<100_000 {
                let unit = units[i % units.count]
                _ = GenericDimension(Double(i), unit: unit)
            }
        }
    }
}
