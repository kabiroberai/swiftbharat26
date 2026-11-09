// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swiftbharat26",
    products: [
        .library(
            name: "swiftbharat26",
            targets: ["SwiftBharat26"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftBharat26",
            dependencies: ["SwiftBharat26Kit"]
        ),
        .target(
            name: "SwiftBharat26Kit"
        ),
        .testTarget(
            name: "SwiftBharat26Tests",
            dependencies: ["SwiftBharat26Kit"],
        ),
    ]
)
