//
//  CalculatorTest.swift
//  RacingCarTest
//
//  Created by sangsun on 2021/11/02.
//

import XCTest

class CalculatorTest: XCTestCase {

    func testValidInput() throws {
        var calculator = Calculator()
        let input = "2 + 3 * 4 / 2"
        let result = try calculator.input(str: input)
        
        XCTAssertEqual(result, 10)
    }
    
    func testInvalidInput1() throws {
        var calculator = Calculator()
        let input = "6 / 3 + 2  * 5 - 1"
        let result = try calculator.input(str: input)
        
        XCTAssertNotEqual(result, 1)
    }
    
    func testInvalidInput2() throws {
        var calculator = Calculator()
        let input = "1 + "
        XCTAssertThrowsError(try calculator.input(str: input))
    }
    
    func testDividedByZero() throws {
        var calculator = Calculator()
        let input = "1 + 2 / 0 * 4"
        
        XCTAssertThrowsError(try calculator.input(str: input))
    }
    
    func testArithmeticOperations() throws {
        let calculator = Calculator()
        
        XCTAssertEqual(calculator.add(1, 2), 3)
        XCTAssertEqual(calculator.substract(5, 3), 2)
        XCTAssertEqual(calculator.multiply(2, 5), 10)
        XCTAssertEqual(try calculator.divide(10, 5), 2)
        XCTAssertThrowsError(try calculator.divide(1, 0))
    }
}
