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
}

class Calculator {
    
    private var evaluation: Int?
    private var currentOperator: String?
    
    private func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    private func sub(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    private func mul(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
    private func div(lhs: Int, rhs: Int) throws -> Int {
        
        if rhs == 0 {
            throw CalculatorError.divideByZero
        }
        
        return lhs / rhs
    }
    
    private func calculate(lhs: Int, rhs: Int, op: String) throws -> Int {
        switch op {
        case "+":
            return add(lhs: lhs, rhs: rhs)
        case "-":
            return sub(lhs: lhs, rhs: rhs)
        case "*":
            return mul(lhs: lhs, rhs: rhs)
        case "/":
            return try div(lhs: lhs, rhs: rhs)
        default:
            throw CalculatorError.unknownOperator
        }
    }
    
    private func isInteger(_ input: String) -> Bool {
        if Int(input) != nil {
            return true
        } else {
            return false
        }
    }
    
    func evaluate(input: String) throws -> Int {
        if input.isEmpty {
            throw CalculatorError.emptyString
        }
        
        let tokens: [String] = input.components(separatedBy: " ")
        
        let operators = tokens.filter { !isInteger($0) }
        let operands = tokens.compactMap { Int($0) }
        
        var result: Int = Int(operands[0])
        
        try operands
            .suffix(from: 1)
            .enumerated()
            .forEach { index, operand in
                result = try calculate(lhs: result, rhs: operand, op: operators[index])
            }
        
        return result
    }
    
}
