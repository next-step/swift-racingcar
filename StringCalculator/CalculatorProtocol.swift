//
//  CalculatorProtocol.swift
//  StringCalculator
//
//  Created by 남기범 on 2021/11/01.
//

import Foundation

protocol CalculatorProtocol {
    func calculate(with string: String?) throws -> Int
    func calculate(_ lhs: Int, _ rhs: Int, operation: Operation) -> Int
}

extension CalculatorProtocol where Self: ArithmeticOperationProtocol {
    func calculate(with string: String?) throws -> Int {
        guard let string = string,
              string.isNotEmpty
        else {
            throw CalculationError.inputNilOrEmpty
        }
        
        let mathematicalExpression = string.components(separatedBy: " ")
        let numbers = mathematicalExpression.compactMap { Int($0) }
        let operators = mathematicalExpression.filter { Int($0) == nil }
        
        var lhs: Int = numbers[0]
        
        for index in 1..<numbers.count {
            guard let operation = Operation(rawValue: operators[index-1]) else {
                throw CalculationError.notArithmeticOperation
            }
            lhs = calculate(lhs, numbers[index], operation: operation)
        }
        
        return lhs
    }
    
    func calculate(_ lhs: Int, _ rhs: Int, operation: Operation) -> Int {
        switch operation {
        case .add:
            return add(lhs, rhs)
        case .substract:
            return substract(lhs, rhs)
        case .divide:
            return divide(lhs, rhs)
        case .multiply:
            return multiply(lhs, rhs)
        }
    }
}

