//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 현은백 on 2022/05/07.
//

import XCTest
//@testable import RacingCar

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
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func test2더하기3은5() throws {
        let calculator: Calculator = Calculator()
        XCTAssert(calculator.add(2,3) == 5, "2 + 3 = 5 실패")
        XCTAssertTrue(calculator.add(2,3) == 5, "2 + 3 = 5 실패")
        XCTAssertEqual(calculator.add(2,3), 5, "2 + 3 = 5 실패")
    }
    
    func test큰수에서_작은수를_빼면_항상_양수다() throws {
        let calculator: Calculator = Calculator()
        XCTAssertGreaterThan(calculator.substract(5, 3), 0, "5 - 3 > 0 실패")
        XCTAssertGreaterThan(calculator.substract(-2, -5), 0, "-2 - (-5) > 0 실패")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
