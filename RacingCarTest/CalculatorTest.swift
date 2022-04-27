//
//  CalculatorTest.swift
//  RacingCarTest
//
//  Created by 카카오VX on 2022/04/25.
//

import XCTest

class CalculatorTest: XCTestCase {
    private var calculator: Calculable = Calculator()
    
    func testAdd() {
        calculator.reset()
        calculator.add(left: 5, right: 10)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 15)
    }
    
    func testSubtract() {
        calculator.reset()
        calculator.subtract(left: 10, right: 4)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 6)
    }
    
    func testMultiply() {
        calculator.reset()
        calculator.multiply(left: 7, right: 4)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 28)
    }
    
    func testDivide() {
        calculator.reset()
        calculator.divide(left: 12, right: 4)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 3)
    }
    
    func testAddCalculate() {
        calculator.reset()
        calculator.calculate(left: 5, right: 6, operator: .add)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 11)
    }
    
    func testSubtractCalculate() {
        calculator.reset()
        calculator.calculate(left: 11, right: 6, operator: .subtract)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 5)
    }
    
    func testMultiplyCalculate() {
        calculator.reset()
        calculator.calculate(left: 5, right: 6, operator: .multiply)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 30)
    }
    
    func testDivideCalculate() {
        calculator.reset()
        calculator.calculate(left: 24, right: 6, operator: .divide)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 4)
    }
    
    func testExecuteCalulator() {
        calculator.reset()
        
        XCTAssertNoThrow(try calculator.execute(expression: "2 + 3 * 4 / 2"))
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 10)
    }
    
    func testSplitCalcExpression() {
        calculator.reset()
        let splitedCalcExpression = calculator.splitCalcExpression("2 + 3 * 4 / 2")
        
        XCTAssertEqual(splitedCalcExpression.count, 3)
        XCTAssertEqual(splitedCalcExpression.stack, ["2", "+", "3", "*", "4", "/", "2"])
    }
    
    func testUnSupportedOperator() {
        calculator.reset()
        XCTAssertThrowsError(try calculator.isValidBasicOperator(input: "2 + 3 ^ 4 / 2"))
    }
    
    func testSupportedOperator() {
        calculator.reset()
        XCTAssertNoThrow(try calculator.isValidBasicOperator(input: "2 + 3 * 4 / 2"))
    }
    
    func testNoInput() {
        calculator.reset()
        XCTAssertThrowsError(try calculator.isValidInput(input: ""))
        XCTAssertThrowsError(try calculator.isValidInput(input: " "))
    }
}
