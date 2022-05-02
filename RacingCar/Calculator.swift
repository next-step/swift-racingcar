//
//  Calculator.swift
//  RacingCar
//
//  Created by main on 2022/05/02.
//

import Foundation

class Calculator {
    
    private let operatorSet = ["+", "-", "*", "/"]
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
    
    private func div(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
    
    private func calculate(lhs: Int, rhs: Int, op: String) -> Int {
        switch op {
        case "+":
            return add(lhs: lhs, rhs: rhs)
        case "-":
            return sub(lhs: lhs, rhs: rhs)
        case "*":
            return mul(lhs: lhs, rhs: rhs)
        case "/":
            return div(lhs: lhs, rhs: rhs)
        default:
            return 0
        }
    }
    
    private func isOperator(_ input: String) -> Bool {
        return operatorSet.contains { $0 == input }
    }
    
    func evaluate(input: String) -> Int {
        let tokens: [String] = input.components(separatedBy: " ")
        
        let operators = tokens.filter { isOperator($0) }
        let operands = tokens.compactMap { Int($0) }
        
        var result: Int = Int(operands[0])
        
        operands
            .suffix(from: 1)
            .enumerated()
            .forEach { index, operand in
                result = calculate(lhs: result, rhs: operand, op: operators[index])
            }
        
        return result
    }
    
}
