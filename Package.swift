// swift-tools-version: 5.10
import PackageDescription

let swiftToolsSupportDependency: Target.Dependency = .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core")
let loggingDependency: Target.Dependency = .product(name: "Logging", package: "swift-log")
let argumentParserDependency: Target.Dependency = .product(name: "ArgumentParser", package: "swift-argument-parser")

var targets: [Target] = [
    .executableTarget(
        name: "dash",
        dependencies: [
            "DashKit"
        ]
    ),
    .target(
        name: "DashKit",
         dependencies: [
            swiftToolsSupportDependency,
            argumentParserDependency,
            "DashPlugin"
         ]
    ),
    .target(
        name: "DashSupport",
        dependencies[
            swiftToolsSupportDependency,
            loggingDependency
        ]
    )
    .target(
        name: "DashPlugin",
        dependencies: ["DashSupport"]
    ),
    .testTarget(
        name: "DashKitTests",
        dependencies: ["DashKit"]
    ),
    .testTarget(
        name: "DashCoreTests",
        dependencies: ["DashCore"]
    ),
    .testTarget(
        name: "DashSupportTests",
        dependencies: ["DashSupport"]
    )
]

let package = Package(
    name: "dash",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "dash", targets: ["dash"]),
        .library(
            name: "DashKit",
            targets: ["DashKit"]
        ),
        .library(
            name: "DashCore",
            targets: ["DashCore"]
        ),
        .library(
            name: "DashSupport",
            targets: ["DashSupport"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.1"),
        .package(url: "https://github.com/apple/swift-log", from: "1.5.4"),
        .package(url: "https://github.com/apple/swift-tools-support-core", from: "0.6.1"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
        .package(url: "https://github.com/pelagornis/plcommand", from: "1.2.5"),
    ],
    targets: targets
)