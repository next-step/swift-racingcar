//
//  ExpressionCalculatorTests.swift
//  RacingCarTest
//
//  Created by Felix.mr on 2021/10/31.
//

import XCTest

class ExpressionCalculatorTests: XCTestCase {

    var expressionCalculator: ExpressionCalculator!
    
    override func setUp() {
        super.setUp()
        
        let parser = ExpressionParser()
        let calculator = Calculator()
        
        self.expressionCalculator = ExpressionCalculator(parser: parser, calculator: calculator)
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.expressionCalculator = nil
    }
    
    func test_expression_calculator_calculate() {
        // Arrange
        let expression = "2 + 3 * 4 / 2"
        
        // Act
        let result = try? expressionCalculator.excute(expression: expression)
        
        // Assert
        XCTAssertEqual(10, result)
    }

    func test_expression_calculator_calculate_throw_empty_error() {
        // Arrange
        let expression = ""
        
        // Act
        // Assert
        XCTAssertThrowsError(try expressionCalculator.excute(expression: expression))
    }
    
    func test_expression_calculator_calculate_throw_invalid_operand() {
        // Arrange
        let expression = "2 + +"
        
        // Act
        // Assert
        XCTAssertThrowsError(try expressionCalculator.excute(expression: expression)) {
            XCTAssertEqual($0 as? ExpressionCalculator.ExpressionError, .invalidOperand)
        }
    }
    
    func test_expression_calculator_calculate_throw_invalid_operator() {
        // Arrange
        let expression = "2 2 3"
        
        // Act
        // Assert
        XCTAssertThrowsError(try expressionCalculator.excute(expression: expression)) {
            XCTAssertEqual($0 as? ExpressionCalculator.ExpressionError, .invalidOperator)
        }
    }
}
