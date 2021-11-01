//
//  CalculatorTest.swift
//  RacingCarTest
//
//  Created by sangsun on 2021/11/02.
//

import XCTest

class CalculatorTest: XCTestCase {

    func testValidInput() throws {
        var cal = Calculator()
        let input = "2 + 3 * 4 / 2"
        let result = try cal.input(str: input)
        
        XCTAssertEqual(result, 10)
    }
    
    func testInvalidInput() throws {
        var cal = Calculator()
        let input = "1 + "
        XCTAssertThrowsError(try cal.input(str: input))
    }
    
    func test_사칙연산() throws {
        let cal = Calculator()
        
        XCTAssertEqual(cal.add(1, 2), 3)
        XCTAssertEqual(cal.substract(5, 3), 2)
        XCTAssertEqual(cal.multiply(2, 5), 10)
        XCTAssertEqual(try cal.divide(10, 5), 2)
        XCTAssertThrowsError(try cal.divide(1, 0))
    }
}
