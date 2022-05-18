//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 현은백 on 2022/05/07.
//

import XCTest
//@testable import RacingCar

class RacingCarTest: XCTestCase {



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
    
    func test3곱하기3은9() throws {
        let calculator: Calculator = Calculator()
        XCTAssert(calculator.multiply(3,3) == 9, "3 * 3 = 3 실패")
        XCTAssertTrue(calculator.multiply(3,3) == 9, "3 * 3 = 3 실패")
        XCTAssertEqual(calculator.multiply(3,3), 9, "3 * 3 = 3 실패")
    }
    
    func test10나누기5는2() throws {
        let calculator: Calculator = Calculator()
        XCTAssert(calculator.divide(10,5) == 2, "10 / 5 = 2 실패")
        XCTAssertTrue(calculator.divide(10,5) == 2, "10 / 5 = 2 실패")
        XCTAssertEqual(calculator.divide(10,5), 2, "10 / 5 = 2 실패")
    }

}
