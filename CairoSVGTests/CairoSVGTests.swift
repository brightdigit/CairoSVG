//
//  CairoSVGTests.swift
//  CairoSVGTests
//
//  Created by Leo Dion on 6/29/20.
//

import XCTest
import CairoSVG
class ImageFile: NSObject, ImageFileProtocol {
  let url: URL

  let format: ImageFileFormat

  init(url: URL, fileFormat: ImageFileFormat) {
    self.url = url
    format = fileFormat
    super.init()
  }
}

class CairoSVGTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let url = URL(fileURLWithPath: "/Users/leo/Desktop/apple.svg")
        let file = ImageFile(url: url, fileFormat: .svg)
        try? ImageHandleBuilder.shared.imageHandle(fromFile: file)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
