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
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.18.7"),
        
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.5.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FHKDesignSystem",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm"),
            ],
            resources: [
                .process("Resources/Fonts"),
                .process("Resources/Colors"),
                .process("Resources/Images"),
                .process("Resources/Lotties")
            ]
        ),
        .testTarget(
            name: "FHKDesignSystemTests",
            dependencies: [
                "FHKDesignSystem",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        ),
    ]
)
