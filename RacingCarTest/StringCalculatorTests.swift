//
//  StringCalculatorTests.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/04/26.
//

import XCTest

class StringCalculatorTests: XCTestCase {
    
    var calculator: StringCalculator = StringCalculator()

    override func setUpWithError() throws {
        calculator = StringCalculator()
    }
    
    func testSplitExpressionToNumbers() throws {
        try calculator.split(mathExpression: "1 + 2 + 3")
        XCTAssert(calculator.numbers == [1, 2, 3], "숫자 분리가 잘 안되었습니다.")
    }
    
    func testSplitExpressionToOperators() throws {
        try calculator.split(mathExpression: "1 + 2 + 3")
        XCTAssert(calculator.operators == ["+", "+"], "숫자 분리가 잘 안되었습니다.")
    }

    func testAdd() throws {
        guard let result = calculator.calculate(1, 2, "+") else { return }
        XCTAssertEqual(result,
                       3,
                       StringCalculatorError.calculateError.localizedDescription)
    }
    
    func testSubstract() throws {
        guard let result = calculator.calculate(1, 2, "-") else { return }
        XCTAssertEqual(result,
                       -1,
                       StringCalculatorError.calculateError.localizedDescription)
    }
    
    func testMultiply() throws {
        guard let result = calculator.calculate(1, 2, "*") else { return }
        XCTAssertEqual(result,
                       2,
                       StringCalculatorError.calculateError.localizedDescription)
    }
    
    func testDivision() throws {
        guard let result = calculator.calculate(2, 1, "/") else { return }
        XCTAssertEqual(result,
                       2,
                       StringCalculatorError.calculateError.localizedDescription)
    }
    
    func testInputNil() throws {
        XCTAssertThrowsError(try calculator.run(with: nil),
                             StringCalculatorError.isNil.localizedDescription) { error in
            guard let error = error as? StringCalculatorError else {
                fatalError("StringCalculatorError가 아닙니다.")
            }
            XCTAssertEqual(error, .isNil, "nil 에러가 아닙니다.")
        }
    }
    
    func testInputEmptyString() throws {
        XCTAssertThrowsError(try calculator.run(with: ""),
                             StringCalculatorError.isEmpty.localizedDescription) { error in
            guard let error = error as? StringCalculatorError else {
                fatalError("StringCalculatorError가 아닙니다.")
            }
            XCTAssertEqual(error, .isEmpty, "empty 에러가 아닙니다.")
        }
    }
    
    func testInputInvalidOperator() throws {
        XCTAssertThrowsError(try calculator.run(with: "1 @ 2"),
                             StringCalculatorError.invalidOperator.localizedDescription) { error in
            guard let error = error as? StringCalculatorError else {
                fatalError("StringCalculatorError가 아닙니다.")
            }
            XCTAssertEqual(error, .invalidOperator, "invaildOperator 에러가 아닙니다.")
        }
    }
}
