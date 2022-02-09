// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VoxeetUXKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "VoxeetUXKit",
            targets: ["VoxeetUXKit"])
    ],
    dependencies: [
      .package(
        name: "VoxeetSDK",
        url: "https://github.com/voxeet/voxeet-sdk-ios.git",
        from: "3.3.3"
      ),
      .package(
        name: "Kingfisher",
        url: "https://github.com/onevcat/Kingfisher.git",
        from: "7.1.0"
      )
    ],
    targets:
        [
        .target(
            name: "VoxeetUXKit",
            dependencies: [
              .product(name:"VoxeetSDK", package: "VoxeetSDK"),
              .product(name:"Kingfisher", package: "Kingfisher"),
            ],
            path: "VoxeetUXKit",
            exclude: ["Info.plist"],
            resources: [
                .process("Info.plist"),
                .process("Resources/Images"),
                .process("Resources/Sounds"),
                .process("Resources/Views")
            ])
    ]
)
