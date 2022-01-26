// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RRAnalyticsKit",
    platforms: [.iOS(.v14), .macOS(.v11), .tvOS(.v14), .watchOS(.v7)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RRAnalyticsKit",
            type: .dynamic,
            targets: ["RRAnalyticsKit"]),
    ],
    dependencies: [
        .package(name: "TelemetryClient", url: "https://github.com/AppTelemetry/SwiftClient", from: "1.0.0")
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RRAnalyticsKit",
            dependencies: ["TelemetryClient"]),
        .testTarget(
            name: "RRAnalyticsKitTests",
            dependencies: ["RRAnalyticsKit"]),
    ]
)
