//
//  RacingTest.swift
//  RacingTest
//
//  Created by 임현규 on 2021/10/27.
//

import XCTest
@testable import RacingCar

class RacingTest: XCTestCase {

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
    
    func test2더하기3은5() throws {
        let calculator: Calculator = Calculator()
        XCTAssert(calculator.add(2, 3) == 5, "2 + 3 = 5 실패")
        XCTAssertTrue(calculator.add(2, 3) == 5, "2 + 3 = 5 실패")
        XCTAssertEqual(calculator.add(2, 3), 5, "2 + 3 = 5 실패")
    }

    func test큰수에서_작은수를_빼면_항상_양수다() throws {
        let calculator: Calculator = Calculator()
        XCTAssertGreaterThan(calculator.substract(5, 3), 0, "5 - 3 > 0 실패")
        XCTAssertGreaterThan(calculator.substract(-2, -5), 0, "-2 - (-5) > 0 실패")
    }
    
    func test0을_곱하면_항상_0이다() throws {
        let calculator: Calculator = Calculator()
        XCTAssertEqual(calculator.multiply(5, 0), 0, "5 * 3 = 0 실패")
        XCTAssertEqual(calculator.multiply(-2, 0), 0, "-2 * 0 = 0 실패")
    }
    
    func test10으로_나누기() throws {
        let calculator: Calculator = Calculator()
        XCTAssertEqual(calculator.division(10, 10), 1, "10 / 10 = 1 실패")
        XCTAssertEqual(calculator.division(100, 10), 10, "100 / 10 = 10 실패")
    }
    
}
