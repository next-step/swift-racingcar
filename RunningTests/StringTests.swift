//
//  RunningTests.swift
//  RunningTests
//
//  Created by ycsong on 2022/04/25.
//

import XCTest

class StringTests: XCTestCase {
    
    private var request: String = ""

    override func setUpWithError() throws { }
    override func tearDownWithError() throws { }

    func testString1() throws {
        request = "1,2"
        XCTAssertEqual(["1", "2"], request.split(separator: ","))
    }
    
    func testString2() throws {
        request = "1"
        XCTAssert(["1"] == request.split(separator: ","))
    }
    
    func testString3() throws {
        request = "(1,2)"
        XCTAssertEqual("1,2", request
                        .replacingOccurrences(of: "(", with: "")
                        .replacingOccurrences(of: ")", with: ""))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
