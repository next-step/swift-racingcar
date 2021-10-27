//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by sangsun on 2021/10/27.
//

import XCTest

class RacingCarTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRequire1() throws {
        XCTAssertEqual("1,2".split(separator: ","), ["1","2"])
        XCTAssertEqual("1".split(separator: ","), ["1"])
    }
    
    func testRequire2() throws {
        XCTAssertEqual("(1,2)".replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: ""), "1,2")
    }

}
