// swift-tools-version: 5.10
import PackageDescription

let swiftToolsSupportDependency: Target.Dependency = .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core")
let loggingDependency: Target.Dependency = .product(name: "Logging", package: "swift-log")
let argumentParserDependency: Target.Dependency = .product(name: "ArgumentParser", package: "swift-argument-parser")

var targets: [Target] = [
    .executableTarget(
        name: "fire",
        dependencies: [
            "FireKit"
        ]
    ),
    .target(
        name: "FireCore",
        dependencies: [
            swiftToolsSupportDependency
            "DashSupport"
            "XcodeProj",
        ]
    )
    .target(
        name: "FireKit",
        dependencies: [
            swiftToolsSupportDependency,
            argumentParserDependency,
            "FirePlugin"
        ]
    ),
    .target(
        name: "FireSupport",
        dependencies[
            swiftToolsSupportDependency,
            loggingDependency
        ]
    )
    .target(
        name: "FirePlugin",
        dependencies: ["FireSupport"]
    ),
    .testTarget(
        name: "FireKitTests",
        dependencies: ["FireKit"]
    ),
    .testTarget(
        name: "FireCoreTests",
        dependencies: ["FireCore"]
    ),
    .testTarget(
        name: "FireSupportTests",
        dependencies: ["FireSupport"]
    )
]

let package = Package(
    name: "fire",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "fire", targets: ["fire"]),
        .library(
            name: "FireKit",
            targets: ["FireKit"]
        ),
        .library(
            name: "FireCore",
            targets: ["FireCore"]
        ),
        .library(
            name: "FireSupport",
            targets: ["FireSupport"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.1"),
        .package(url: "https://github.com/apple/swift-log", from: "1.5.4"),
        .package(url: "https://github.com/apple/swift-tools-support-core", from: "0.6.1"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
        .package(url: "https://github.com/tuist/XcodeProj", exact: "8.20.0"),
        .package(url: "https://github.com/pelagornis/plcommand", from: "1.2.5"),
        .package(url: "https://github.com/jihoonme/swift-html", from: "1.0.0"),
        .package(url: "https://github.com/jihoonme/swift-css", from: "1.0.0"),
    ],
    targets: targets
)