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
    
}
