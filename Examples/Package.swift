// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Examples",
    platforms: [
        .macOS(.v12),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13)
    ],
    products: [
        .executable(
            name: "Examples",
            targets: ["Examples"]
        ),
    ],
    dependencies: [
        .package(name: "QueueMacro", path: "../"),
    ],
    targets: [
        .executableTarget(
            name: "Examples",
            dependencies: [
                .product(name: "QueueMacro", package: "QueueMacro"),
            ],
            path: "Sources"
        )
    ]
)
