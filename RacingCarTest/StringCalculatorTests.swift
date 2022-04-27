//
//  StringCalculatorTests.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/04/26.
//

import XCTest

class StringCalculatorTests: XCTestCase {
    
    lazy var calculator: StringCalculator = {
        return StringCalculator()
    }()

    override func setUpWithError() throws {
        calculator = StringCalculator()
    }

    func testAdd() throws {
        let result = try calculator.run(with: "1 + 2")
        XCTAssertEqual(result,
                       3,
                       StringCalculatorError.calculateError.localizedDescription)
    }
    
    func testSubstract() throws {
        let result = try calculator.run(with: "1 - 2")
        XCTAssertEqual(result,
                       -1,
                       StringCalculatorError.calculateError.localizedDescription)
    }
    
    func testMultiply() throws {
        let result = try calculator.run(with: "1 * 2")
        XCTAssertEqual(result,
                       2,
                       StringCalculatorError.calculateError.localizedDescription)
    }
    
    func testDivision() throws {
        let result = try calculator.run(with: "2 / 1")
        XCTAssertEqual(result,
                       2,
                       StringCalculatorError.calculateError.localizedDescription)
    }
    
    func testInputNil() throws {
        XCTAssertThrowsError(try calculator.run(with: nil),
                             StringCalculatorError.passNil.localizedDescription) { error in
            guard let error = error as? StringCalculatorError else {
                fatalError("StringCalculatorError가 아닙니다.")
            }
            XCTAssertEqual(error, .passNil, "nil 에러가 아닙니다.")
        }
    }
    
    func testInputEmptyString() throws {
        XCTAssertThrowsError(try calculator.run(with: ""),
                             StringCalculatorError.passEmpty.localizedDescription) { error in
            guard let error = error as? StringCalculatorError else {
                fatalError("StringCalculatorError가 아닙니다.")
            }
            XCTAssertEqual(error, .passEmpty, "empty 에러가 아닙니다.")
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
