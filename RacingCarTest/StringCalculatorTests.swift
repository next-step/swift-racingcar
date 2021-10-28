//
//  StringCalculatorTests.swift
//  RacingCarTest
//
//  Created by Felix.mr on 2021/10/28.
//

import XCTest

class StringCalculatorTests: XCTestCase {
    
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
        let result = calculator.add(99, to: 1)
        
        // Assert
        XCTAssertEqual(100, result)
    }
    
    func test_calculator_subtract() {
        // Act
        let result = calculator.subtract(9, from: 99)

        // Assert
        XCTAssertEqual(90, result)
    }
    
    func test_calculator_divide() {
        // Act
        let result = calculator.divide(6, into: 2)
        
        // Assert
        XCTAssertEqual(3, result)
    }
    
    func test_calculator_multiply() {
        // Act
        let result = calculator.multiply(2, by: 5)
        
        // Assert
        XCTAssertEqual(10, result)
    }
}

class Calculator {
    
    func add(_ left: Int, to right: Int) -> Int {
        return left + right
    }
    
    func subtract(_ left: Int, from right: Int) -> Int {
        return right - left
    }
    
    func divide(_ left: Int, into right: Int) -> Int {
        return left / right
    }
    
    func multiply(_ left: Int, by right: Int) -> Int {
        return left * right
    }
}
