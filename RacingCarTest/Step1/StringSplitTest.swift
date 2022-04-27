//
//  StringSplitTest.swift
//  RacingCarTest
//
//  Created by 이정배 on 2022/04/27.
//

import Foundation
import XCTest

class StringSplitTest: XCTestCase {

    func testStringSplitRequirement1() {
        XCTAssertEqual("1,2".split(separator: ","), ["1", "2"])
        XCTAssert("1,2".split(separator: ",") == ["1", "2"])
        
        XCTAssertEqual("1".split(separator: ","), ["1"])
        XCTAssert("1".split(separator: ",") == ["1"])
    }
}
