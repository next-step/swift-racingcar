//
// Created by 이정배 on 2022/04/30.
//

import Foundation
import XCTest

class StringCalculatorTest: XCTestCase {

    func testInputNil() {
        let input: String? = nil

        let calculator: StringCalculator = StringCalculator()
        try XCTAssertThrowsError(calculator.calculate(input))
    }

    func testInputEmptyString() {
        let input: String = ""

        let calculator: StringCalculator = StringCalculator()
        try XCTAssertThrowsError(calculator.calculate(input))
    }
}
