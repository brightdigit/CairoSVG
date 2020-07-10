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
        path: "build/CairoSVG.xcframework"
        //url: "https://github.com/brightdigit/CairoSVG/releases/download/0.1.0-alpha.1/CairoSVG.xcframework.zip",
        //checksum: "3a1f7ba992691e7c4b191c79f8e8cb4318d61811fc47dd0e09314c321fac023a"
    )
  ]
)
