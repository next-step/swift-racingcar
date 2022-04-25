//
//  StringTests.swift
//  StringTests
//
//  Created by 이우섭 on 2022/04/25.
//

import XCTest

class StringTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testSplitTwoWordsBySeperator() {
        let sut = "1,2"
        let converted = sut.split(separator: ",")
        XCTAssertEqual(converted, ["1", "2"])
    }
    
    func testConvertOneWordWithSeperator() {
        let sut = "1,"
        let converted = sut.split(separator: ",")
        XCTAssert(converted == ["1"])
    }
    
    func testSplitTwoWordsWithParenthesesBySeperator() {
        let sut = "(1,2)"
        let converted = sut
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .split(separator: ",")
        XCTAssertEqual(converted, ["1", "2"])
    }

}
