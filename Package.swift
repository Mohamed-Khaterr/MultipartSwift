// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MultipartSwift",
    products: [ // Client
        .library(
            name: "MultipartSwift",
            targets: ["MultipartSwift"]
        ),
    ],
    targets: [ // Module
        .target(name: "MultipartSwift"),
        .testTarget(
            name: "MultipartSwiftTests",
            dependencies: ["MultipartSwift"]
        ),
    ]
)
