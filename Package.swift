// swift-tools-version: 5.8
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
    dependencies: [
        // 1. Google Mobile Ads SDK (AdMob)
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            exact: "12.14.0"
        ),

        // 2, Cauly SDK
        .package(
            url: "https://github.com/cauly/CaulySPM.git",
            exact: "3.1.22"
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
                // .target(name: "AdWhaleSDK"),
                "AdWhaleSDK",

                // AdMob
                .product(
                    name: "GoogleMobileAds",
                    package: "swift-package-manager-google-mobile-ads"
                ),

                // Cauly
                .product(
                    name: "CaulySDK",
                    package: "CaulySPM"
                )
            ]
        )
    ]
)
