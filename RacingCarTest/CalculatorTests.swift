//
//  CalculatorTests.swift
//  RacingCarTest
//
//  Created by main on 2022/05/02.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    let calculator = Calculator()
    
    override func setUpWithError() throws {}
    
    override func tearDownWithError() throws {}

    func test_given2더하기1_when_then정수3() throws {
        // given
        let input = "2 + 1"
        
        // when
        let result = try calculator.evaluate(input: input)
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_given2빼기1_when_then정수1() throws {
        // given
        let input = "2 - 1"
        
        // when
        let result = try calculator.evaluate(input: input)
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_given2곱하기2_when_then정수4() throws {
        // given
        let input = "2 * 2"
        
        // when
        let result = try calculator.evaluate(input: input)
        
        // then
        XCTAssertEqual(result, 4)
    }
    
    func test_given4나누기2_when_then정수2() throws {
        // given
        let input = "4 / 2"
        
        // when
        let result = try calculator.evaluate(input: input)
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_given5나누기3_when나머지가발생하는경우_then정수1() throws {
        // given
        let input = "5 / 3"
        
        // when
        let result = try calculator.evaluate(input: input)
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_given5나누기0_when0으로나눈경우_thenDivideByZeroException() throws {
        let input = "5 / 0"
        
        XCTAssertThrowsError(try calculator.evaluate(input: input)) { error in
            XCTAssertEqual(error as? CalculatorError, .divideByZero)
        }
    }
    
    func test_given입력이빈값_when_thenEmptyException() throws {
        let input = ""
        
        XCTAssertThrowsError(try calculator.evaluate(input: input)) { error in
            XCTAssertEqual(error as? CalculatorError, .emptyString)
        }
    }
    
    func test_given사칙연산이아닌문자포함_when_thenUnknownOperatorException() throws {
        let input = "5 s 0"
        
        XCTAssertThrowsError(try calculator.evaluate(input: input)) { error in
            XCTAssertEqual(error as? CalculatorError, .unknownOperator)
        }
    }
    
    func test_given6더하기5빼기4곱하기4나누기2_when사칙연산모두있는경우_then정수14() throws {
        // given
        let input = "6 + 5 - 4 * 4 / 2"
        
        // when
        let result = try calculator.evaluate(input: input)
        
        // then
        XCTAssertEqual(result, 14)
    }
}
