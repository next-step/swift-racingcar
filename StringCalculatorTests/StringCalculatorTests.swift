//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by 김성준 on 2022/05/01.
//

import XCTest
@testable import StringCalculator

class StringCalculatorTests: XCTestCase {

    private let calculator = StringCalculator()
    
    func test_두_정수의_덧셈이_잘_동작하는지() {
        let a = 1
        let b = 4
        
        let result = calculator.add(a: a, b: b)
        XCTAssertEqual(result, a + b)
    }
    
    func test_두_정수의_뺄셈이_잘_동작하는지() {
        let a = 3
        let b = 2
        
        let result = calculator.substract(a: a, b: b)
        XCTAssertEqual(result, a - b)
    }
    
    func test_두_정수의_나눗셈이_잘_동작하는지() {
        let a = 3
        let b = 3
        
        let result = calculator.division(a: a, b: b)
        XCTAssertEqual(result, a / b)
    }
    
    func test_두_정수의_곱셈이_잘_동작하는지() {
        let a = 3
        let b = 3
        
        let result = calculator.multiply(a: a, b: b)
        XCTAssertEqual(result, a * b)
    }
    
    func test_입력값이_nil인경우_stringIsEmptyOrNil_throw발생하는지() throws {
        //given
        let arithmeticString: String? = nil
        
        //when
        //then
        XCTAssertThrowsError(try calculator.calculate(string: arithmeticString)) { error in
            XCTAssertEqual(error as! StringCalculator.CalculatorError, StringCalculator.CalculatorError.stringIsEmptyOrNil)
        }
    }
    
    func test_문자가_사칙연산기호가_아닐경우_false_반환하는지() throws {
        //given
        let arithmeticAdd: String = "+"
        let arithmeticSubstrct: String = "-"
        let arithmeticMultiply: String = "*"
        let arithmeticDivision: String = "/"
        let other: String = "="
        
        //when
        let result0 = arithmeticAdd.isArithmeticalCode()
        let result1 = arithmeticSubstrct.isArithmeticalCode()
        let result2 = arithmeticMultiply.isArithmeticalCode()
        let result3 = arithmeticDivision.isArithmeticalCode()
        let result4 = other.isArithmeticalCode()
        
        //then
        XCTAssertTrue(result0, "사칙연산 기호지만 false 반환이 되었다.")
        XCTAssertTrue(result1, "사칙연산 기호지만 false 반환이 되었다.")
        XCTAssertTrue(result2, "사칙연산 기호지만 false 반환이 되었다.")
        XCTAssertTrue(result3, "사칙연산 기호지만 false 반환이 되었다.")
        XCTAssertFalse(result4, "사칙연산 기호가 아닌데도 true반환이 되었다.")
    }
    
    func test_사칙연산기호가_아닌_기호가_포함된_경우_true반환하는지() {
        //given
        let successCode0: String = "+ -"
        let successCode1: String = "+ - / *"
        let failCode0: String = "+ - / * ="
        let failCode1: String = "="
        
        //when
        let result0 = calculator.containsWrongArithmeticalCode(string: successCode0)
        let result1 = calculator.containsWrongArithmeticalCode(string: successCode1)
        let result2 = calculator.containsWrongArithmeticalCode(string: failCode0)
        let result3 = calculator.containsWrongArithmeticalCode(string: failCode1)
        
        //then
        XCTAssertFalse(result0, "사칙연산 기호가 포함되지 않았지만 true 반환이 되었다.")
        XCTAssertFalse(result1, "사칙연산 기호가 포함되지 않았지만 true 반환이 되었다.")
        XCTAssertTrue(result2, "사칙연산 기호가 아닌 기호가 포함되었지만 false 반환이 되었다.")
        XCTAssertTrue(result3, "사칙연산 기호가 아닌 기호가 포함되었지만 false 반환이 되었다.")
    }
    
    func test_연산메서드가_사칙연산기호가_아닌_기호가_포함된_경우_containsWrongOperatorCode_throw발생하는지() throws {
        //given
        let failCode0: String = "1 + 2 - 3 / 4 * 5 = 6"

        //when
        //when
        XCTAssertThrowsError(try calculator.calculate(string: failCode0)) { error in
            XCTAssertEqual(error as! StringCalculator.CalculatorError, StringCalculator.CalculatorError.containsWrongOperatorCode)
        }
    }

    func test_2_더하기_4가_6이_되는지() throws {
        //given
        let numberA: Int = 2
        let numberB: Int = 4
        let arithmeticString: String = "\(numberA) + \(numberB)"
        
        //when
        let result = try calculator.calculate(string: arithmeticString)
        
        //then
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 6)
    }
    
    func test_4_빼기_3이_1이_되는지() throws {
        //given
        let numberA: Int = 4
        let numberB: Int = 3
        let arithmeticString: String = "\(numberA) - \(numberB)"
        
        //when
        let result = try calculator.calculate(string: arithmeticString)
        
        //then
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 1)
    }
    
    func test_2_곱하기_4가_8이_되는지() throws {
        //given
        let numberA: Int = 2
        let numberB: Int = 4
        let arithmeticString: String = "\(numberA) * \(numberB)"
        
        //when
        let result = try calculator.calculate(string: arithmeticString)
        
        //then
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 8)
    }
    
    func test_4_나누기_2가_2이_되는지() throws {
        //given
        let numberA: Int = 4
        let numberB: Int = 2
        let arithmeticString: String = "\(numberA) / \(numberB)"
        
        //when
        let result = try calculator.calculate(string: arithmeticString)
        
        //then
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 2)
    }
    
    func test_1부터10까지_정수의합_55되는지() throws {
        //given
        let arithmeticString: String = "1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10"
        
        //when
        let result = try calculator.calculate(string: arithmeticString)
        
        //then
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 55)
    }
    
    func test_사칙연산을_표현한_문자열의_연산이_정상작동되는지() throws {
        //given
        let arithmeticString: String = "2 + 3 * 4 / 2"
        
        //when
        let result = try calculator.calculate(string: arithmeticString)
        
        //then
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 10)
    }
    
   
}
