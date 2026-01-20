// swift-tools-version: 5.8
// 업데이트3
import PackageDescription

let package = Package(
    name: "AdWhaleSPM",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "AdWhaleSPM",
            targets: ["AdWhaleSDKResources"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdWhaleSDK",
            path: "AdWhaleSDK.xcframework"
        ),

        .target(
            name: "AdWhaleSDKResources",
            dependencies: [
                .target(name: "AdWhaleSDK")
            ]
        )
    ]
)
