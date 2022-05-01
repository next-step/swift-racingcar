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

    func testAdd() {
        let calculator: Calculator = Calculator()

        XCTAssertTrue(calculator.add(3, 5) == 8, "3 + 5 연산 결과가 8 아님")
        XCTAssertTrue(calculator.add(0, -1) == -1, "0 + (-1) 연산 결과가 -1 아님")
    }

    func testSubtract() {
        let calculator: Calculator = Calculator()

        XCTAssertTrue(calculator.subtract(3, 5) == -2, "3 - 5 연산 결과가 -2 아님")
        XCTAssertTrue(calculator.subtract(0, -1) == 1, "0 - (-1)  연산 결과가 1 아님")
    }

    func testMultiply() {
        let calculator: Calculator = Calculator()

        XCTAssertTrue(calculator.multiply(3, 5) == 15, "3 * 5 연산 결과가 15 아님")
        XCTAssertTrue(calculator.multiply(0, -1) == 0, "0 * (-1)  연산 결과가 0 아님")
    }

    func testDivide() {
        let calculator: Calculator = Calculator()

        XCTAssertTrue(try calculator.divide(3, 5) == 0, "3 / 5 연산 결과가 0 아님")
        XCTAssertTrue(try calculator.divide(0, -1) == 0, "0 / (-1)  연산 결과가 0 아님")

        XCTAssertThrowsError(try calculator.divide(5, 0))
    }

    func testStringCalculate() {
        let calculator: Calculator = Calculator()

        XCTAssertTrue(try calculator.calculateStringExpression("2 + 3 * 4 / 2 - 7") == 3, "2 + 3 * 4 / 2 - 7 연산 결과가 3 아님")
        XCTAssertTrue(try calculator.calculateStringExpression("2") == 2, "2 연산 결과가 2 아님")
    }
}
