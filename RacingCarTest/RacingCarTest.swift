//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 김효성 on 2021/10/27.
//

import XCTest

class RacingCarTest: XCTestCase {
    func test2더하기3은5() throws {
        let calculator: Calculator = Calculator()
        XCTAssert(calculator.add(2, 3) == 5, "2 + 3 = 5 실패")
        XCTAssertTrue(calculator.add(2, 3) == 5, "2 + 3 = 5 실패")
        XCTAssertEqual(calculator.add(2, 3), 5, "2 + 3 = 5 실패")
    }
    
    func test큰수에서_작은수를_빼면_항상_양수다() throws {
        let calculator: Calculator = Calculator()
        XCTAssertGreaterThan(calculator.substract(5, 3), 0, "5 - 3 > 0 실패")
        XCTAssertGreaterThan(calculator.substract(-2, -5), 0, "-2 - (-5) > 0 실패")
    }
    
    func test_multiply_isSuccess() {
        let calculator: Calculator = Calculator()
        let firstNumber: Int = 3
        let secondNumber: Int = 4
        
        XCTAssertTrue(calculator.multiply(firstNumber, secondNumber) == 12)
    }
    
    func test_multiply_isFailure() {
        let calculator: Calculator = Calculator()
        let firstNumber: Int = 3
        let secondNumber: Int = 4
        
        XCTAssertFalse(calculator.multiply(firstNumber, secondNumber) == 13)
    }
    
    func test_devide_isSuccess() {
        let calculator: Calculator = Calculator()
        let firstNumber: Int = 4
        let secondNumber: Int = 2
        
        XCTAssertTrue(calculator.devide(firstNumber, secondNumber) == 2)
    }
    
    func test_devide_isFailure() {
        let calculator: Calculator = Calculator()
        let firstNumber: Int = 3
        let secondNumber: Int = 4
        
        
        XCTAssertFalse(calculator.devide(firstNumber, secondNumber) == 2)
    }
}
