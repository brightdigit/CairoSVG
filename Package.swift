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
      url: "https://github.com/brightdigit/CairoSVG/releases/download/0.1.5/CairoSVG.xcframework.zip",
      checksum: "fdf295c4420f742358e10f3f5d42c38c3face7d9653c78245cb75c07f3944442"
    )
  ]
)
