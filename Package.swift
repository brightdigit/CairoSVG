// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CairoSVG",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "CairoSVG",
      targets: ["CairoSVG"]
    )
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .binaryTarget(
      name: "CairoSVG",
      url: "https://github.com/brightdigit/CairoSVG/releases/download/0.1.11/CairoSVG.xcframework.zip",
      checksum: "ffac14623db0c7df9e4d444d831893f974c1bea5dfda69a83a324dfdf169096e"
    )
  ]
)
