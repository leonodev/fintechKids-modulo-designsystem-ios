// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FHKDesignSystem",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FHKDesignSystem",
            targets: ["FHKDesignSystem"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FHKDesignSystem",
            dependencies: [],
            resources: [
                .process("Resources/Fonts"),  // Esto incluye las fuentes
                .process("Resources/Colors"),   // assets de colores
                .process("Resources/Images"),
            ]
        ),
        .testTarget(
            name: "FHKDesignSystemTests",
            dependencies: ["FHKDesignSystem"]
        ),
    ]
)
