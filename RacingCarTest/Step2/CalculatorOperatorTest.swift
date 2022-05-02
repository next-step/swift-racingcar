//
// Created by 이정배 on 2022/05/02.
//

import Foundation
import XCTest

class CalculatorOperatorTest: XCTestCase {

    func testAdd3With5() {
        XCTAssertTrue(try CalculatorOperator.add.execute(3, 5) == 8, "3 + 5 연산 결과가 8 아님")
    }

    func testAdd0WithMinus1() {
        XCTAssertTrue(try CalculatorOperator.add.execute(0, -1) == -1, "0 + (-1) 연산 결과가 -1 아님")
    }

    func testSubtract5From3() {
        XCTAssertTrue(try CalculatorOperator.subtract.execute(3, 5) == -2, "3 - 5 연산 결과가 -2 아님")
    }

    func testSubtractMinus1From0() {
        XCTAssertTrue(try CalculatorOperator.subtract.execute(0, -1) == 1, "0 - (-1)  연산 결과가 1 아님")
    }

    func testMultiply3With5() {
        XCTAssertTrue(try CalculatorOperator.multiply.execute(3, 5) == 15, "3 * 5 연산 결과가 15 아님")
    }

    func testMultiply0WithMinus1() {
        XCTAssertTrue(try CalculatorOperator.multiply.execute(0, -1) == 0, "0 * (-1)  연산 결과가 0 아님")
    }

    func testDivide3By5() {
        XCTAssertTrue(try CalculatorOperator.divide.execute(3, 5) == 0, "3 / 5 연산 결과가 0 아님")
    }

    func testDivide0ByMinus1() {
        XCTAssertTrue(try CalculatorOperator.divide.execute(0, -1) == 0, "0 / (-1)  연산 결과가 0 아님")
    }

    func testInvalidInputDivideBy0() {
        XCTAssertThrowsError(try CalculatorOperator.divide.execute(5, 0))
    }
}
