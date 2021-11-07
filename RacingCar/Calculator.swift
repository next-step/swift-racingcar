//
//  Calculator.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

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
