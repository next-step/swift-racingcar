//
//  RacingTest.swift
//  RacingTest
//
//  Created by 임현규 on 2021/10/27.
//

import XCTest
@testable import RacingCar

class RacingTest: XCTestCase {
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
