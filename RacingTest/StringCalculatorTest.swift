//
//  StringCalculatorTest.swift
//  RacingTest
//
//  Created by 임현규 on 2021/10/29.
//

import XCTest
@testable import RacingCar

class StringCalculatorTest: XCTestCase {
    
    
    let stringCalculator = StringCalculator(userInput: "1 + 2 + 4")
    
    func test_isHasOperator() {
        
        XCTAssertEqual(stringCalculator.isHasValidationOperator(data: ["1", "3", "4", "5"]), false)
        XCTAssertEqual(stringCalculator.isHasValidationOperator(data: ["1", "+", "4"]), true)
        XCTAssertEqual(stringCalculator.isHasValidationOperator(data: ["1", "5", "2", "1"]), false)
    }
    
    func test_isDataIntAbleString() {
        XCTAssertEqual(stringCalculator.isHasIntAbleString(data: ["1", "3", "4", "5"]), true)
        XCTAssertEqual(stringCalculator.isHasIntAbleString(data: ["1", "a", "4"]), true)
        XCTAssertEqual(stringCalculator.isHasIntAbleString(data: ["1", "5", "2", "1"]), true)
    }
    
    func test_add() {
        XCTAssertEqual(stringCalculator.add(9, 10), 19)
        XCTAssertEqual(stringCalculator.add(9, 7), 16)
        XCTAssertEqual(stringCalculator.add(5, 50), 55)
    }
    
    func test_minus() {
        XCTAssertEqual(stringCalculator.minus(100, 10), 90)
        XCTAssertEqual(stringCalculator.minus(50, 10), 40)
        XCTAssertEqual(stringCalculator.minus(5, 10), -5)
    }
    
    func test_multiple() {
        XCTAssertEqual(stringCalculator.multiple(9, 10), 90)
        XCTAssertEqual(stringCalculator.multiple(9, 7), 63)
        XCTAssertEqual(stringCalculator.multiple(5, 50), 250)
    }
    
    func test_divide() {
        XCTAssertEqual(stringCalculator.divide(10, 10), 1)
        XCTAssertEqual(stringCalculator.divide(10, 2), 5)
        XCTAssertEqual(stringCalculator.divide(5, 5), 1)
    }
}
