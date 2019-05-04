// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "elfReader",
    products: [
        .library(
            name: "elfReader",
            targets: ["elfReader"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "elfReader",
            dependencies: []),
        .testTarget(
            name: "elfReaderTests",
            dependencies: ["elfReader"]),
    ]
)
