// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "AdWhaleSPM",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AdWhaleSDK",
            targets: ["AdWhaleSDKResources"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            exact: "13.0.0"
        ),
        .package(
            url: "https://github.com/googleads/googleads-mobile-ios-mediation-applovin.git",
            exact: "13.5.100"
        ),
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
                .target(name: "AdWhaleSDK"),
                .product(
                    name: "GoogleMobileAds",
                    package: "swift-package-manager-google-mobile-ads"
                ),
                .product(
                    name: "AppLovinAdapterTarget",
                    package: "googleads-mobile-ios-mediation-applovin"
                ),
                .product(
                    name: "CaulySDK",
                    package: "CaulySPM"
                )
            ]
        )
    ]
)