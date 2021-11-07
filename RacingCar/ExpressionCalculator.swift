//
//  ExpressionCalculator.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

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
        
        guard let `operator` = try? calculator.makeOperator(from: subExpression.removeLast()) else {
            throw ExpressionError.invalidOperator
        }
        
        guard let left = try? calculateRecursively(expression: subExpression) else {
            throw ExpressionError.invalidExpression
        }
        
        return calculator.calculate(left: left, right: right, operator: `operator`)
    }
}
