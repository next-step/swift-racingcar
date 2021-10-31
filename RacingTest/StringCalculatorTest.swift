//
//  StringCalculatorTest.swift
//  RacingTest
//
//  Created by 임현규 on 2021/10/29.
//

import XCTest
@testable import RacingCar

class StringCalculatorTest: XCTestCase {
    
    func test_add_input() {
        let calculator = StringCalculator(userInput: "1 + 5")
        XCTAssertEqual(calculator.startStringCalculate(), 6)
    }
    
    func test_subtract_input() {
        let calculator = StringCalculator(userInput: "5 - 1")
        XCTAssertEqual(calculator.startStringCalculate(), 4)
    }
    
    func test_multiply_input() {
        let calculator = StringCalculator(userInput: "1 * 5")
        XCTAssertEqual(calculator.startStringCalculate(), 5)
    }
    
    func test_divide_input() {
        let calculator = StringCalculator(userInput: "5 / 5")
        XCTAssertEqual(calculator.startStringCalculate(), 1)
    }
    
    func test_two_operator() {
        let calculator = StringCalculator(userInput: "5 / 5 * 10")
        XCTAssertEqual(calculator.startStringCalculate(), 10)
    }
    
    func test_two_operator_2() {
        let calculator = StringCalculator(userInput: "5 * 5 + 10")
        XCTAssertEqual(calculator.startStringCalculate(), 35)
    }
    
    func test_two_operator_3() {
        let calculator = StringCalculator(userInput: "5 + 5 - 10")
        XCTAssertEqual(calculator.startStringCalculate(), 0)
    }
    
    func test_two_operator_4() {
        let calculator = StringCalculator(userInput: "5 / 5 + 1")
        XCTAssertEqual(calculator.startStringCalculate(), 2)
    }
}
