//
//  CalculatorTest.swift
//  RacingCarTest
//
//  Created by 카카오VX on 2022/04/25.
//

import XCTest

class CalculatorTest: XCTestCase {
    private var calculator: Calculable = Calculator()
    
    override func setUpWithError() throws {
        calculator.reset()
    }
    
    func testAdd() {
        calculator.add(left: 5, right: 10)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 15)
    }
    
    func testSubtract() {
        calculator.subtract(left: 10, right: 4)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 6)
    }
    
    func testMultiply() {
        calculator.multiply(left: 7, right: 4)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 28)
    }
    
    func testDivide() {
        calculator.divide(left: 12, right: 4)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 3)
    }
    
    func testAddCalculate() {
        calculator.calculate(left: 5, right: 6, operator: .add)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 11)
    }
    
    func testSubtractCalculate() {
        calculator.calculate(left: 11, right: 6, operator: .subtract)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 5)
    }
    
    func testMultiplyCalculate() {
        calculator.calculate(left: 5, right: 6, operator: .multiply)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 30)
    }
    
    func testDivideCalculate() {
        calculator.calculate(left: 24, right: 6, operator: .divide)
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 4)
    }
    
    func testExecuteCalulator() {
        XCTAssertNoThrow(try calculator.execute(expression: "2 + 3 * 4 / 2"))
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 10)
    }
    
    func testSplitCalcExpression() {
        let splitedCalcExpression = calculator.splitCalcExpression("2 + 3 * 4 / 2")
        
        XCTAssertEqual(splitedCalcExpression.count, 3)
        XCTAssertEqual(splitedCalcExpression.stack, ["2", "+", "3", "*", "4", "/", "2"])
    }
    
    func testUnSupportedOperator() {
        XCTAssertThrowsError(try calculator.execute(expression: "2 + 3 ^ 4 / 2"))
    }
    
    func testNoInput() {
        XCTAssertThrowsError(try calculator.isValidInput(input: ""))
        XCTAssertThrowsError(try calculator.isValidInput(input: " "))
    }
}
