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
        
        let result = calculator.더하다(a: a, b: b)
        XCTAssertEqual(result, a + b)
    }
    
    func test_두_정수의_뺄셈이_잘_동작하는지() {
        let a = 3
        let b = 2
        
        let result = calculator.빼다(a: a, b: b)
        XCTAssertEqual(result, a - b)
    }
    
    func test_두_정수의_나눗셈이_잘_동작하는지() {
        let a = 3
        let b = 3
        
        let result = calculator.나누다(a: a, b: b)
        XCTAssertEqual(result, a / b)
    }
    
    func test_두_정수의_곱셈이_잘_동작하는지() {
        let a = 3
        let b = 3
        
        let result = calculator.곱하다(a: a, b: b)
        XCTAssertEqual(result, a * b)
    }
    
    func test_입력값이_nil인경우_nil반환하는지() throws {
        //given
        let arithmeticString: String? = nil
        
        //when
        let result = calculator.calculate(string: arithmeticString)
        
        //then
        XCTAssertNil(result, "입력값이 nil이지만 nil이 반환되지 않았다.")
    }
    
    func test_문자가_사칙연산기호가_아닐경우_false_반환하는지() {
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
    
    func test_사칙연산기호가_아닌_기호가_포함된_경우_true반환하는지_0() {
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
    
    func test_연산메서드가_사칙연산기호가_아닌_기호가_포함된_경우_nil반환하는지() {
        //given
        let successCode0: String = "+ -"
        let successCode1: String = "+ - / *"
        let failCode0: String = "+ - / * ="
        let failCode1: String = "="
        
        //when
        let result0 = calculator.calculate(string: successCode0)
        let result1 = calculator.calculate(string: successCode1)
        let result2 = calculator.calculate(string: failCode0)
        let result3 = calculator.calculate(string: failCode1)
        
        //then
        XCTAssertNotNil(result0, "연산메서드가 사칙연산 기호가 포함되지 않았지만 nil 반환이 되었다.")
        XCTAssertNotNil(result1, "연산메서드가 사칙연산 기호가 포함되지 않았지만 nil 반환이 되었다.")
        XCTAssertNil(result2, "연산메서드가 사칙연산 기호가 아닌 기호가 포함되었지만 nil 반환이 되지 않았다.")
        XCTAssertNil(result3, "연산메서드가 사칙연산 기호가 아닌 기호가 포함되었지만 nil 반환이 되지 않았다.")
    }
    
    
    
    
   
}
