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
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
                 from: "1.18.7"),
        
        .package(url: "https://github.com/airbnb/lottie-spm.git",
                 from: "4.5.2"),
        
        .package(url: "https://github.com/leonodev/fintechKids-modulo-injections-ios.git",
                 branch: "main")
     
    ],
    targets: [
        .target(
            name: "FHKDesignSystem",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm"),
                // Modules FHK
                .product(name: "FHKInjections", package: "fintechKids-modulo-injections-ios")
            ],
            resources: [
                .process("Resources/Fonts"),
                .process("Resources/Colors/Colors.xcassets"),
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
