// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-w3c-css-tests",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    dependencies: [
        // Parent package
        .package(path: "../"),
        // Testing framework
        .package(path: "../../../swift-foundations/swift-testing"),
        // Test primitives (for test utilities)
        .package(path: "../../../swift-primitives/swift-test-primitives"),
    ],
    targets: [
        .testTarget(
            name: "W3C CSS Shared Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Shared Tests"
        ),
        .testTarget(
            name: "W3C CSS Values Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Values Tests"
        ),
        .testTarget(
            name: "W3C CSS Color Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Color Tests"
        ),
        .testTarget(
            name: "W3C CSS Syntax Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Syntax Tests"
        ),
        .testTarget(
            name: "W3C CSS Cascade Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Cascade Tests"
        ),
        .testTarget(
            name: "W3C CSS Selectors Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Selectors Tests"
        ),
        .testTarget(
            name: "W3C CSS Variables Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Variables Tests"
        ),
        .testTarget(
            name: "W3C CSS Display Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Display Tests"
        ),
        .testTarget(
            name: "W3C CSS Flexbox Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Flexbox Tests"
        ),
        .testTarget(
            name: "W3C CSS Grid Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Grid Tests"
        ),
        .testTarget(
            name: "W3C CSS Positioning Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Positioning Tests"
        ),
        .testTarget(
            name: "W3C CSS Multicolumn Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Multicolumn Tests"
        ),
        .testTarget(
            name: "W3C CSS BoxModel Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS BoxModel Tests"
        ),
        .testTarget(
            name: "W3C CSS Text Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Text Tests"
        ),
        .testTarget(
            name: "W3C CSS Fonts Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Fonts Tests"
        ),
        .testTarget(
            name: "W3C CSS TextDecoration Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS TextDecoration Tests"
        ),
        .testTarget(
            name: "W3C CSS WritingModes Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS WritingModes Tests"
        ),
        .testTarget(
            name: "W3C CSS Backgrounds Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Backgrounds Tests"
        ),
        .testTarget(
            name: "W3C CSS Images Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Images Tests"
        ),
        .testTarget(
            name: "W3C CSS Transforms Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Transforms Tests"
        ),
        .testTarget(
            name: "W3C CSS Filters Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Filters Tests"
        ),
        .testTarget(
            name: "W3C CSS Masking Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Masking Tests"
        ),
        .testTarget(
            name: "W3C CSS Compositing Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Compositing Tests"
        ),
        .testTarget(
            name: "W3C CSS Animations Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Animations Tests"
        ),
        .testTarget(
            name: "W3C CSS Transitions Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Transitions Tests"
        ),
        .testTarget(
            name: "W3C CSS Easing Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Easing Tests"
        ),
        .testTarget(
            name: "W3C CSS Conditional Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Conditional Tests"
        ),
        .testTarget(
            name: "W3C CSS MediaQueries Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS MediaQueries Tests"
        ),
        .testTarget(
            name: "W3C CSS UI Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS UI Tests"
        ),
        .testTarget(
            name: "W3C CSS PseudoElements Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS PseudoElements Tests"
        ),
        .testTarget(
            name: "W3C CSS PseudoClasses Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS PseudoClasses Tests"
        ),
        .testTarget(
            name: "W3C CSS Containment Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Containment Tests"
        ),
        .testTarget(
            name: "W3C CSS Scroll Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Scroll Tests"
        ),
        .testTarget(
            name: "W3C CSS Logical Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Logical Tests"
        ),
        .testTarget(
            name: "W3C CSS Alignment Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Alignment Tests"
        ),
        .testTarget(
            name: "W3C CSS Lists Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Lists Tests"
        ),
        .testTarget(
            name: "W3C CSS CounterStyles Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS CounterStyles Tests"
        ),
        .testTarget(
            name: "W3C CSS Paged Tests",
            dependencies: [
                .product(name: "W3C CSS Shared", package: "swift-w3c-css"),
                .product(name: "Testing", package: "swift-testing"),
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ],
            path: "Sources/W3C CSS Paged Tests"
        )
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let settings: [SwiftSetting] = [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
    ]
    target.swiftSettings = (target.swiftSettings ?? []) + settings
}
