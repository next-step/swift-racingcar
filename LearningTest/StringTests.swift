//
//  StringTests.swift
//  StringTests
//
//  Created by 이우섭 on 2022/04/25.
//

import XCTest

class StringTests: XCTestCase {
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSplitTwoWordsBySeperator() {
        let sut = "1,2"
        let converted = sut.split(separator: ",")
        XCTAssertEqual(converted, ["1", "2"])
    }
    
    func testConvertOneWordWithSeperator() {
        let sut = "1,"
        let converted = sut.split(separator: ",")
        XCTAssertEqual(converted, ["1"])
    }

}
