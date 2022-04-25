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
        calculator.calculate(expression: "5 + 6")
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 11)
    }
    
    func testSubtractCalculate() {
        calculator.reset()
        calculator.calculate(expression: "11 - 6")
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 5)
    }
    
    func testMultiplyCalculate() {
        calculator.reset()
        calculator.calculate(expression: "5 * 6")
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 30)
    }
    
    func testDivideCalculate() {
        calculator.reset()
        calculator.calculate(expression: "24 / 6")
        let calculated = calculator.calculated()
        
        XCTAssertEqual(calculated, 4)
    }
}
