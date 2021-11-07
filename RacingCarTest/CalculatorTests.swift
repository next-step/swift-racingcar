//
//  CalculatorTests.swift
//  RacingCarTest
//
//  Created by Felix.mr on 2021/10/28.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        
        self.calculator = Calculator()
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.calculator = nil
    }
    
    func test_calculator_add() {
        // Act
        let result = calculator.calculate(left: 99, right: 1, operator: .add)
        
        // Assert
        XCTAssertEqual(100, result)
    }
    
    func test_calculator_subtract() {
        // Act
        let result = calculator.calculate(left: 99, right: 9, operator: .subtract)

        // Assert
        XCTAssertEqual(90, result)
    }
    
    func test_calculator_divide() {
        // Act
        let result = calculator.calculate(left: 6, right: 2, operator: .divide)
        
        // Assert
        XCTAssertEqual(3, result)
    }
    
    func test_calculator_multiply() {
        // Act
        let result = calculator.calculate(left: 2, right: 5, operator: .multiply)
        
        // Assert
        XCTAssertEqual(10, result)
    }
}
