// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "API-iOS",
    platforms: [.iOS("14.0.0"), .macOS("11")],
    products: [
        .library(
            name: "API-iOS",
            targets: ["API-iOS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "API-iOS",
            dependencies: ["SwiftyJSON"],
            path: "API-iOS"
            ,swiftSettings: [
                   .define("ENABLE_SOMETHING", .when(configuration: .debug)),
            ]
        ),
        .testTarget(
            name: "API_iOSTests",
            dependencies: ["API-iOS"],path: "API_iOSTests"),
    ]
)
