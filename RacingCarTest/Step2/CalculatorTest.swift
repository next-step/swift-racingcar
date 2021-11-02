//
//  CalculatorTest.swift
//  RacingCarTest
//
//  Created by 조민호 on 2021/10/31.
//

import XCTest

class CalculatorTest: XCTestCase {

    let calculator = Calculator()
    let input = UserInput()
    
    func test_덧셈() throws {
        let result = calculator.add(5, 5)
        let expect = 10
        
        XCTAssertEqual(result, expect)
    }

    func test_뺄셈() throws {
        let result = calculator.subtract(5, 5)
        let expect = 0
        
        XCTAssertEqual(result, expect)
    }
    
    func test_곱셈() throws {
        let result = calculator.multiply(5, 5)
        let expect = 25
        
        XCTAssertEqual(result, expect)
    }
    
    func test_나눗셈() throws {
        let result = try calculator.divide(5, 5)
        let expect = 1
        
        XCTAssertEqual(result, expect)
    }
        
    func test_사칙연산을_모두_포함하는_기능() throws {
        let result = try calculator.output(["2","+","3","*","4","/","2"])
        let expect = 10
        
        XCTAssertEqual(result, expect)
    }
    
    func test_사칙연산_기호가_아닌경우() throws {
        XCTAssertThrowsError(try calculator.calculate(2, "#", 3)) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.valueIsNotOperator)
        }
    }
    
    func test_숫자로_변형하지_못하는_문자수식을_입력한경우() throws {
        XCTAssertThrowsError(try calculator.convertStringToNumber("ㅁ")) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.valueUnableConvetStringToInt)
        }
    }
    
    func test_입력값이_빈값인경우() throws {
        XCTAssertThrowsError(try input.inputValidCheck("")) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.valueIsEmpty)
        }
    }
    
    func test_입력값_앞에_공백이_포함되는경우() throws {
        XCTAssertThrowsError(try input.inputValidCheck(" 2 + 3")) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.valueHasWhiteSpace)
        }
    }
    
    func test_입력값_뒤에_공백이_포함되는경우() throws {
        XCTAssertThrowsError(try input.inputValidCheck("2 + 3 ")) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.valueHasWhiteSpace)
        }
    }
    
    func test_입력값의_문자가_2개_이하인경우() throws {
        XCTAssertThrowsError(try input.inputValidCheck("2 +")) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.valueIsBelowMinimumCount)
        }
    }
}
