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

class Calculator {
    
    enum `Operator` {
        
        case add
        case subtract
        case divide
        case multiply
    }
    
    enum CalculatorError: Error {
        
        case invalidOperator
    }
    
    func makeOperator(from operatorString: String) throws -> Operator? {
        switch operatorString {
        case "+": return .add
        case "-": return .subtract
        case "/": return .divide
        case "*": return .multiply
        default: throw CalculatorError.invalidOperator
        }
    }
    
    func calculate(left: Int, right: Int, operator: Operator) -> Int {
        switch `operator` {
        case .add:
            return add(left, to: right)
        case .subtract:
            return subtract(right, from: left)
        case .divide:
            return divide(left, into: right)
        case .multiply:
            return multiply(left, by: right)
        }
    }
    
    private func add(_ left: Int, to right: Int) -> Int {
        return left + right
    }
    
    private func subtract(_ left: Int, from right: Int) -> Int {
        return right - left
    }
    
    private func divide(_ left: Int, into right: Int) -> Int {
        return left / right
    }
    
    private func multiply(_ left: Int, by right: Int) -> Int {
        return left * right
    }
}
