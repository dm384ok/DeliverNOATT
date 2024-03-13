// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeLiver",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DeLiver",
            targets: ["DeLiver"]),
    ],

    dependencies: [
        .package(
            url: "https://github.com/AppsFlyerSDK/AppsFlyerFramework.git", from: "6.9.0"),
        .package(
            url: "https://github.com/OneSignal/OneSignal-iOS-SDK",  branch: "main"),
        .package(
            url: "https://github.com/airbnb/lottie-ios", from: "4.3.4"),
        .package(
            url: "https://github.com/facebook/facebook-ios-sdk.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DeLiver",
            dependencies: [
                
                .target(name: "Punder"),
                
                .product(name: "OneSignalFramework", package: "OneSignal-iOS-SDK"),
                .product(name: "OneSignalInAppMessages", package: "OneSignal-iOS-SDK"),
                .product(name: "OneSignalLocation", package: "OneSignal-iOS-SDK"),
                .product(name: "OneSignalExtension", package: "OneSignal-iOS-SDK"),
                .product(name: "AppsFlyerLib", package: "AppsFlyerFramework"),
                .product(name: "Lottie", package: "lottie-ios"),

                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                .product(name: "FacebookAEM", package: "facebook-ios-sdk"),
            ]
        ),
        
        .binaryTarget(
            name: "Punder",
            path: "./Sources/Punder.xcframework"),

    ],
    swiftLanguageVersions: [.v5]
)
