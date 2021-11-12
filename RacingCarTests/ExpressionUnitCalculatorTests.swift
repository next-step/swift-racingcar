//
//  ExpressionUnitCalculatorTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/11/01.
//

import XCTest

class ExpressionUnitCalculatorTests: XCTestCase {
    func test_init_throwing_error() {
        let invalidInputs = [
            [""],
            ["1"],
            ["1", "+"]
        ]
        
        invalidInputs.forEach {
            initWithEmptyInputError(input: $0)
        }
    }
    
    func test_init() {
        XCTAssertNoThrow(try ExpressionUnitCalculator(["1", "+", "2"]))
    }
    
    func test_calculate() {
        let inputs = [
            ["2", "+", "1"],
            ["2", "-", "1"],
            ["2", "*", "1"],
            ["2", "/", "1"]
        ]
        let results = [3, 1, 2, 2]
        
        inputs.enumerated().forEach { index, input in
            let calculator = try? ExpressionUnitCalculator(input)
            XCTAssertEqual(calculator?.calculate(), results[index])
        }
    }
}

extension ExpressionUnitCalculatorTests {
    func initWithEmptyInputError(input: [String]) {
        XCTAssertThrowsError(
            try ExpressionUnitCalculator(input),
            "The ExpressionUnitCalculator should have thrown an ExpressionInputError.notOperation"
        ) { error in
            XCTAssertEqual(error as? ExpressionInputError, .notOperation)
        }
    }
}
