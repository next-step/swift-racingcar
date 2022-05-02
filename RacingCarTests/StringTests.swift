//
//  StringTests.swift
//  RacingCarTests
//
//  Created by 박정연 on 2022/04/28.
//

import XCTest

class StringTests: XCTestCase {

    func testSplitTwoElements() {
        let splitted = "1,2".split(separator: ",")
        XCTAssertEqual(splitted, ["1", "2"])
    }

    func testSplitOneElement() {
        let splitted = "1".split(separator: ",")
        XCTAssertEqual(splitted, ["1"])
    }

    func testRemoveParenthesesAndSplitTwoElements() {
        let parenthesesRemoved = "(1,2)".replacingOccurrences(of: "[()]", with: "", options: .regularExpression)
        let splitted = parenthesesRemoved.split(separator: ",")
        XCTAssertEqual(splitted, ["1", "2"])
    }
}
