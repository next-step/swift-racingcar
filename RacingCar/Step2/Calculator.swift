//
//  Calculator.swift
//  RacingCar
//
//  Created by 조민호 on 2021/10/30.
//

import Foundation

struct Calculator {
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func subtract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func divide(_ lhs: Int, _ rhs: Int) throws -> Int {
        
        guard lhs > 0 && rhs > 0 else {
            throw CalculatorError.valueIsBelowZero
        }
        
        return lhs / rhs
    }
    
    func output(_ expression: [String]) throws -> Int {
        var accumulate = try convertStringToNumber(expression[0])
        
        for expressionIndex in stride(from: 1, to: expression.count, by: 2) {
            let operatorType = expression[expressionIndex]
            let to = try convertStringToNumber(expression[expressionIndex + 1])
            
            accumulate = try calculate(accumulate, operatorType, to)
        }
        
        return accumulate
    }
    
    func calculate(_ lhs: Int, _ operatorType: String, _ rhs: Int) throws -> Int {
        switch operatorType {
        case Operator.add.rawValue:
            return add(lhs, rhs)
        case Operator.subtract.rawValue:
            return subtract(lhs, rhs)
        case Operator.multiply.rawValue:
            return multiply(lhs, rhs)
        case Operator.divide.rawValue:
            return try divide(lhs, rhs)
        default:
            throw CalculatorError.valueIsNotOperator
        }
    }
    
    func convertStringToNumber(_ expressionString: String) throws -> Int {
        guard let expressionString = Int(expressionString) else {
            throw CalculatorError.valueUnableConvetStringToInt
        }
        
        return expressionString
    }
}

