//
//  StringTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/26.
//

import XCTest

class StringTest: XCTestCase {

    func test_요구사항1_1() {
        let result = "1,2".split(separator: ",")
        XCTAssertEqual(result, ["1", "2"])
    }
    
    func test_요구사항1_2() {
        let result = "1".split(separator: ",")
        XCTAssertEqual(result, ["1"])
    }
    
    func test_요구사항2() {
        let data = "(1,2)"
        let result = data.replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
        XCTAssertEqual(result, "1,2")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
