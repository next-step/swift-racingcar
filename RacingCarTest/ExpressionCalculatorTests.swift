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


class ExpressionCalculator {

    enum ExpressionError: Error {

        case invalidOperand
        case invalidOperator
        case invalidExpression
    }

    private let expressionParser: Parserable
    private let calculator: Calculator

    init(parser: Parserable, calculator: Calculator) {
        self.expressionParser = parser
        self.calculator = calculator
    }

    func excute(expression: String) throws -> Int {
        let parsedExpression = try parse(expression)
        
        return try calculateRecursively(expression: parsedExpression)
    }
}

private extension ExpressionCalculator {
    
    func parse(_ expression: String) throws -> [String] {
        let parsedExpression = try expressionParser.parse(expression: expression)
        
        return parsedExpression
    }
    
    func calculateRecursively(expression: [String]) throws -> Int {
        guard !expression.isEmpty else { throw ExpressionError.invalidExpression }
        guard expression.count > 1 else {
            
            if let lastExpression = expression.first,
               let lastValue = Int(lastExpression) {
                return lastValue
            }
            
            throw ExpressionError.invalidOperand
        }
        
        var subExpression = expression
        
        guard let right = Int(subExpression.removeLast()) else {
            throw ExpressionError.invalidOperand
        }
        
        guard let `operator` = try? calculator.operator(subExpression.removeLast()) else {
            throw ExpressionError.invalidOperator
        }
        
        guard let left = try? calculateRecursively(expression: subExpression) else {
            throw ExpressionError.invalidExpression
        }
        
        return calculator.calculate(left: left, right: right, operator: `operator`)
    }
}
