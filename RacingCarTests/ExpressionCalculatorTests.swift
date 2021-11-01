//
//  ExpressionCalculatorTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/11/01.
//

import XCTest

class ExpressionCalculatorTests: XCTestCase {
    let calculator = ExpressionCalculator(expression: ["1", "+", "2", "*", "3"])
    
    func test_calculate_throwing_notOperation_error() {
        let calculatorThrowingError = ExpressionCalculator(expression: ["1", "+", "2", "*"])
        
        XCTAssertThrowsError(
            try calculatorThrowingError.calculate(),
            "The ExpressionCalculator should have thrown an ExpressionInputError.notOperation"
        ) { error in
            XCTAssertEqual(error as? ExpressionInputError, .notOperation)
        }
    }
    
    func test_calculate_throwing_invalidOutput_error() {
        let invalidInputs = [
            [],
            [""]
        ]
        
        invalidInputs.forEach { invalidInput in
            let calculatorThrowingError = ExpressionCalculator(expression: invalidInput)
            initWithEmptyInputError(calculator: calculatorThrowingError)
        }
    }

    
    func test_calculate_not_throwing_error() {
        XCTAssertNoThrow(try calculator.calculate())
    }
    
    func test_calculate_return_value() {
        XCTAssertEqual(try? calculator.calculate(), 9)
    }
}

extension ExpressionCalculatorTests {
    func initWithEmptyInputError(calculator calculatorThrowingError: ExpressionCalculator) {
        XCTAssertThrowsError(
            try calculatorThrowingError.calculate(),
            "The ExpressionCalculator should have thrown an ExpressionInputError.invalidOutput"
        ) { error in
            XCTAssertEqual(error as? ExpressionInputError, .invalidOutput)
        }
    }
}
