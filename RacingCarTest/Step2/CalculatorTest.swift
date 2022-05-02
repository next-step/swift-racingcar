//
// Created by 이정배 on 2022/04/30.
//

import Foundation
import XCTest

class CalculatorTest: XCTestCase {

    func testInvalidInputNil() {
        let input: String? = nil

        let calculator: Calculator = Calculator()
        try XCTAssertThrowsError(calculator.calculateStringExpression(input))
    }

    func testInvalidInputEmptyString() {
        let input: String = ""

        let calculator: Calculator = Calculator()
        try XCTAssertThrowsError(calculator.calculateStringExpression(input))
    }

    func testInvalidInputBlankString() {
        let input: String = "     "

        let calculator: Calculator = Calculator()
        try XCTAssertThrowsError(calculator.calculateStringExpression(input))
    }

    func testInvalidInputStartWithOperator() {
        let input: String = " / 7"

        let calculator: Calculator = Calculator()
        XCTAssertThrowsError(try calculator.calculateStringExpression(input))
    }

    func testInvalidInputEndWithOperator() {
        let input: String = "2 / 7 +"

        let calculator: Calculator = Calculator()
        XCTAssertThrowsError(try calculator.calculateStringExpression(input))
    }

    func testStringCalculate() {
        let calculator: Calculator = Calculator()

        XCTAssertTrue(try calculator.calculateStringExpression("2 + 3 * 4 / 2 - 7") == 3, "2 + 3 * 4 / 2 - 7 연산 결과가 3 아님")
        XCTAssertTrue(try calculator.calculateStringExpression("2") == 2, "2 연산 결과가 2 아님")
    }
}
