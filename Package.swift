// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ListsKit",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "ListsKit",
            targets: ["ListsKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.1.1"),
    ],
    targets: [
        .target(
            name: "ListsKit",
            dependencies: [
              "RxSwift",
              .product(name: "RxCocoa", package: "RxSwift")
        ]),
    ]
)
