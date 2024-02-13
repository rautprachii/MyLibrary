
// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    platforms: [
        .iOS(.v14), // Adjust the platform version as needed
        .macOS(.v10_15), // Adjust the platform version as needed
    ],
    products: [
        .library(
            name: "MyLibrary",
            targets: ["MyLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.5.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "9.0.0"),
        // Add other dependencies if needed
    ],
    targets: [
        .target(
            name: "MyLibrary",
            dependencies: [
                "Alamofire",
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
            ]),
        
        .testTarget(
            name: "MyLibraryTests",
            dependencies: ["MyLibrary"]),
    ]
)
