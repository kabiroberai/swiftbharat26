// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swiftbharat26",
    platforms: [
        .iOS(.v27),
    ],
    products: [
        .library(
            name: "swiftbharat26",
            targets: ["SwiftBharat26"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.6.0"),
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.7.0"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.17.0"),
        .package(url: "https://github.com/kabiroberai/SnapshotPreviews", branch: "render-hooks"),
        // we don't use this but need the explicit dependency to keep the lockfile stable.
        // TODO: remove once https://github.com/pointfreeco/combine-schedulers/issues/120 is fixed
        .package(url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.14.0"),
    ],
    targets: [
        .target(
            name: "SwiftBharat26",
            dependencies: [
                "SwiftBharat26Kit",
                .product(name: "SnapshottingTestsCore", package: "SnapshotPreviews"),
            ]
        ),
        .target(
            name: "SwiftBharat26Kit",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "DependenciesMacros", package: "swift-dependencies"),
            ]
        ),
        .testTarget(
            name: "SwiftBharat26Tests",
            dependencies: ["SwiftBharat26Kit"],
        ),
    ]
)
