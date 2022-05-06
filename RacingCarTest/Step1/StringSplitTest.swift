//
//  StringSplitTest.swift
//  RacingCarTest
//
//  Created by 이정배 on 2022/04/27.
//

import Foundation
import XCTest

class StringSplitTest: XCTestCase {

    /// 요구사항 1.1
    func testStringSplitMultiple() {
        XCTAssertEqual("1,2".split(separator: ","), ["1", "2"])
        XCTAssert("1,2".split(separator: ",") == ["1", "2"])
    }
    
    /// 요구사항 1.2
    func testSplitStringSingle() {
        XCTAssertEqual("1".split(separator: ","), ["1"])
        XCTAssert("1".split(separator: ",") == ["1"])
    }
    
    /// 요구사항 2
    func testSplitStringWithRemovingBraces() {
        XCTAssertEqual("(1,2)".replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .split(separator: ","), ["1", "2"])
        XCTAssert("(1,2)".replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .split(separator: ",") == ["1", "2"])
    }
}
