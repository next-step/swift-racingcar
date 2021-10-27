//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by sangsun on 2021/10/27.
//

import XCTest

class RacingCarTest: XCTestCase {

    func testRequire1() throws {
        XCTAssertEqual("1,2".split(separator: ","), ["1","2"])
        XCTAssertEqual("1".split(separator: ","), ["1"])
    }
    
    func testRequire2() throws {
        XCTAssertEqual("(1,2)".replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: ""), "1,2")
    }

}
