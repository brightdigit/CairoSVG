#!/bin/bash
rm -rf build 
mkdir build
xcodebuild test -scheme CairoSVGTests
xcodebuild archive -scheme CairoSVG -configuration Release -archivePath ./build/CairoSVG.xcarchive SKIP_INSTALL=NO -arch x86_64
xcodebuild -create-xcframework -framework ./build/CairoSVG.xcarchive/Products/Library/Frameworks/CairoSVG.framework -output ./build/CairoSVG.xcframework
ditto -c -k --sequesterRsrc --keepParent build/CairoSVG.xcframework build/CairoSVG.xcframework.zip
swift package compute-checksum build/CairoSVG.xcframework.zip