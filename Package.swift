// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VoxeetUXKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "VoxeetUXKit", targets: ["VoxeetUXKit"])
    ],
    targets: [
        .target(
            name: "VoxeetUXKit",
            path: "VoxeetUXKit",
            exclude: ["Other/Info.plist"],
            resources: [
                .process("Other/Info.plist"),
                .process("Assets/Images"),
                .process("Assets/Sounds")
            ])
    ]
)
