//
// Created by 이정배 on 2022/04/30.
//

import Foundation
import XCTest

class CalculatorTest: XCTestCase {

    func testInputNil() {
        let input: String? = nil

        let calculator: Calculator = Calculator()
        try XCTAssertThrowsError(calculator.calculateStringExpression(input))
    }

    func testInputEmptyString() {
        let input: String = ""

        let calculator: Calculator = Calculator()
        try XCTAssertThrowsError(calculator.calculateStringExpression(input))
    }
}
