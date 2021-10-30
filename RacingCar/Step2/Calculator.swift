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
    
    func divide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
    
    func stringCalculate(_ expression: [String]) -> Int {
        var accumulate = convertStringToNumber(expression[0])
        
        for i in stride(from: 1, to: expression.count, by: 2) {
            let operatorType = expression[i]
            let to = convertStringToNumber(expression[i + 1])
            
            accumulate = calculate(accumulate, operatorType, to)
        }
        
        return accumulate
    }
    
    func calculate(_ lhs: Int, _ operatorType: String, _ rhs: Int) -> Int {
        switch operatorType {
        case Operator.add.rawValue:
            return add(lhs, rhs)
        case Operator.subtract.rawValue:
            return subtract(lhs, rhs)
        case Operator.multiply.rawValue:
            return multiply(lhs, rhs)
        case Operator.divide.rawValue:
            return divide(lhs, rhs)
        default:
            // TODO: 예외처리
            return -1
        }
    }
    
    func convertStringToNumber(_ expressionString: String) -> Int {
        
        guard let expressionString = Int(expressionString) else {
            // TODO: 예외처리
            return -1
        }
        
        return expressionString
    }
}

