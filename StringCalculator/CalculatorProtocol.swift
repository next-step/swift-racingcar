//
//  CalculatorProtocol.swift
//  StringCalculator
//
//  Created by 남기범 on 2021/11/01.
//

import Foundation

protocol CalculatorProtocol {
    func calculate(with string: String?) throws -> Int
}

extension CalculatorProtocol where Self: ArithmeticOperationProtocol {
    func calculate(with string: String?) throws -> Int {
        let string = try stringValidation(string)
        
        let mathematicalExpression = string.components(separatedBy: " ")
        let numbers = mathematicalExpression.compactMap { Int($0) }
        let operators = mathematicalExpression.filter { Int($0) == nil }
        
        return try initOperationAndCalculate(numbers: numbers, operators: operators)
    }
    
    private func stringValidation(_ string: String?) throws -> String {
        guard let string = string,
              string.isNotEmptyAndWhiteSpace
        else {
            throw CalculationError.inputNilOrEmpty
        }
        
        return string
    }
    
    private func initOperationAndCalculate(numbers: [Int], operators: [String]) throws -> Int {
        var lhs: Int = numbers[0]
        
        for index in 1..<numbers.count {
            guard let operation = Operation(rawValue: operators[index-1]) else {
                throw CalculationError.notArithmeticOperation
            }
            lhs = calculate(lhs, numbers[index], operation: operation)
        }
        
        return lhs
    }
    
    private func calculate(_ lhs: Int, _ rhs: Int, operation: Operation) -> Int {
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

