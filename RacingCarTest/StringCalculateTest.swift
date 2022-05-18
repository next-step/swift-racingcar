//
//  StringCalculateTest.swift
//  StringCalculateTest
//
//  Created by 현은백 on 2022/05/07.
//

import XCTest
//@testable import RacingCar

class StringCalculateTest: XCTestCase {

    func testValidInput() throws {
        let calculator = try StringCalculator("2 + 3 * 4 / 2")
        let result = try calculator.calculate()
        XCTAssertEqual(result, 10)
    }
    
    func testInvalidInput1() throws {
        let calculator = try StringCalculator("6 / 3 + 2  * 5 - 1")
        let result = try calculator.calculate()
        XCTAssertNotEqual(result, 1)
    }
    
    func testInvalidInput2() throws {
        let calculator = try StringCalculator("1 + ")
        XCTAssertThrowsError(try calculator.calculate())
    }
    
    func testOnlyNumber() throws {
        let calculator = try StringCalculator("1")
        XCTAssertEqual(try calculator.calculate(), 1)
    }
    
    func testDividedByZero() throws {
        let calculator = try StringCalculator("1 + 2 / 0 * 4")
        XCTAssertThrowsError(try calculator.calculate())
    }

}
