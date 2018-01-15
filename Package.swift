// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cli",
    dependencies: [
        //.package(url: "https://github.com/unnamedd/SwiftTips.git", .upToNextMajor(from: "0.1.0")),
        .package(url: "../framework", .branch("master")),
        .package(url: "https://github.com/OpenKitten/Meow.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "cli",
            dependencies: ["TipsCore", "Meow"]
        ),
    ]
)
