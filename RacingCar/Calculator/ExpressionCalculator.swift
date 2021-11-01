//
//  ExpressionCalculator.swift
//  RacingCar
//
//  Created by itzel.du on 2021/10/31.
//

import Foundation

struct ExpressionCalculator {
    private let expression: [String]
    
    init(expression: [String]) {
        self.expression = expression
    }
    
    func calculate() throws -> Int {
        guard expression.count > 1
        else { return try lastValue }
        
        return try childExpressionCalculator.calculate()
    }
    
    private var lastValue: Int {
        get throws {
            guard let lastValue = expression.last,
                  let returnValue = Int(lastValue)
            else { throw ExpressionInputError.invalidOutput }
            
            return returnValue
        }
    }
    
    private var childExpressionCalculator: Self {
        get throws {
            let expressionUnitCount = 3
            let expressionUnit = try ExpressionUnitCalculator(expression.prefix(expressionUnitCount))
            let calculatedValue = String(expressionUnit.calculate())
            let childExpression = [calculatedValue] + Array(expression.dropFirst(expressionUnitCount))
            
            return Self(expression: childExpression)
        }
    }
}
