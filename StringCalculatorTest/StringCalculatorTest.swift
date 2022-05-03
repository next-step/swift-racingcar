//
//  StringCalculatorTest.swift
//  StringCalculatorTest
//
//  Created by brian은석 on 2022/04/29.
//

import XCTest
@testable import RacingCar


class StringCalculatorTest: XCTestCase {
    let calculator = StringCalculator()

    func test_add_one_two() throws {
        let result = try calculator.caculate(input: "1 + 2")
        XCTAssert(result == 3, "1 + 2 = 3 오류")
    }
    
    func test_subtract_two_one() throws {
        let result = try calculator.caculate(input: "2 - 1")
        XCTAssert(result == 1, "2 - 1 = 1 오류")
    }
    
    func test_multiply_two_four() throws {
        let result = try calculator.caculate(input: "2 * 4")
        print(result)
        XCTAssert(result == 8, "2 * 4 = 8 오류")
    }
    
    func test_divide_ten_two() throws {
        let result = try calculator.caculate(input: "10 / 2")
        XCTAssert(result == 5, "10 / 2 = 5 오류")
    }
    
    func test_input_nil() throws {
        do {
            let _ = try calculator.caculate(input: nil)
        } catch {
            if let error = error as? StringCalculatorError {
                XCTAssert(error == StringCalculatorError.inputNil, error.errorDescription)
            }
        }
    }
    
    func test_wrong_operator() throws {
        do {
            let _ = try calculator.caculate(input: "1 f 2")
        } catch {
            if let error = error as? StringCalculatorError {
                XCTAssert(error == StringCalculatorError.isNotOperator, error.errorDescription)
            }
        }
    }
    
    func test_complicated_calculate() throws {
        let result = try calculator.caculate(input: "1 + 2 * 12 / 3 - 5")
        XCTAssert(result == 7, "1 + 2 * 12 / 3 - 5 = 7 오류")

    }
}
