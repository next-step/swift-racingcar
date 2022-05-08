//
//  StringCalculatorTest.swift
//  StringCalculatorTest
//
//  Created by hakyung on 2022/05/03.
//

import XCTest

class StringCalculatorTest: XCTestCase {
    let stringCalculator = StringCalculator()

    func testAdd() throws {
        XCTAssertEqual(try stringCalculator.doAllCalculations(inputString: "2 + 3"), 5)
    }
    
    func testSubstract() throws {
        XCTAssertEqual(try stringCalculator.doAllCalculations(inputString: "3 - 1"), 2)
    }
    
    func testMultiply() throws {
        XCTAssertEqual(try stringCalculator.doAllCalculations(inputString: "7 * 9"), 63)
    }
    
    func testDivision() throws {
        XCTAssertEqual(try stringCalculator.doAllCalculations(inputString: " 5 / 2"), 2)
    }
    
    func testcheckEmpty() throws {
        XCTAssertEqual(stringCalculator.checkEmptyString(inputString: "     "), false)
    }
    
    func testInvalidCalculator() throws {
        XCTAssertEqual(stringCalculator.checkOperators(inputString: "3 + 5 - 2 ) 1"), false)
    }

    func testAllCalculator() throws {
        XCTAssertEqual(try stringCalculator.doAllCalculations(inputString: "3 + 5 - 1 * 4 / 2"), 14)
    }
}
