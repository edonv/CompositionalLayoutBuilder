// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var platforms: [SupportedPlatform] = [
    .iOS(.v13),
    .macCatalyst(.v13),
    .macOS(.v10_15),
    .tvOS(.v13)
]

#if swift(>=5.9) && os(visionOS)
platforms.append(.visionOS(.v1))
#endif

let package = Package(
    name: "CompositionalLayoutBuilder",
    platforms: platforms,
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CompositionalLayoutBuilder",
            targets: ["CompositionalLayoutBuilder"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CompositionalLayoutBuilder",
            resources: [.copy("../PrivacyInfo.xcprivacy")]
        ),
        .testTarget(
            name: "CompositionalLayoutBuilderTests",
            dependencies: ["CompositionalLayoutBuilder"]),
    ]
)
