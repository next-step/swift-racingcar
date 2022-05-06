//
//  Calculator.swift
//  RacingCar
//
//  Created by main on 2022/05/02.
//

import Foundation

enum CalculatorError: Error {
    case divideByZero
    case emptyString
    case unknownOperator
    case emptyOperands
}

class Calculator {
    
    private var evaluation: Int?
    private var currentOperator: String?
    
    private func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    private func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    private func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    private func divide(_ lhs: Int, _ rhs: Int) throws -> Int {
        
        guard rhs != 0 else {
            throw CalculatorError.divideByZero
        }
        
        return lhs / rhs
    }
    
    private func calculate(lhs: Int, rhs: Int, operatorCharacter: String) throws -> Int {
        switch operatorCharacter {
        case "+":
            return add(lhs, rhs)
        case "-":
            return substract(lhs, rhs)
        case "*":
            return multiply(lhs, rhs)
        case "/":
            return try divide(lhs, rhs)
        default:
            throw CalculatorError.unknownOperator
        }
    }
    
    func evaluate(input: String) throws -> Int {
        guard input.isEmpty == false else {
            throw CalculatorError.emptyString
        }
        
        let tokens: [String] = input.components(separatedBy: " ")
        
        let operators = tokens.filter { false == $0.isInteger }
        let operands = tokens.compactMap { Int($0) }
        
        guard let firstOperand = operands.first else {
            throw CalculatorError.emptyOperands
        }
        var result: Int = Int(firstOperand)
        
        try operands
            .suffix(from: 1)
            .enumerated()
            .forEach { index, operand in
                result = try calculate(lhs: result, rhs: operand, operatorCharacter: operators[index])
            }
        
        return result
    }
    
}
