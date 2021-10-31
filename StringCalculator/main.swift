//
//  main.swift
//  StringCalculator
//
//  Created by 남기범 on 2021/10/29.
//

import Foundation

protocol ArithmeticOperationProtocol {
    func add(_ lhs: Int, _ rhs: Int) -> Int
    func substract(_ lhs: Int, _ rhs: Int) -> Int
    func divide(_ lhs: Int, _ rhs: Int) -> Int
    func multiply(_ lhs: Int, _ rhs: Int) -> Int
}

extension ArithmeticOperationProtocol {
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    func divide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
}

enum Operation: String, CaseIterable {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    
    static func factory(stringValue: String) -> Operation? {
        let operations = Operation.allCases.filter { $0.rawValue == stringValue }
        
        guard operations.count > 0,
              let operation = operations.first
        else {
            return nil
        }
        
        return operation
    }
}

protocol CalculatorProtocol {
    func calculate(with string: String) -> Int?
    func calculate(_ lhs: Int, _ rhs: Int, operation: Operation) -> Int
}

extension CalculatorProtocol where Self: ArithmeticOperationProtocol {
    func calculate(with string: String) -> Int? {
        let components = string.components(separatedBy: " ")
        let numbers = components.compactMap { Int($0) }
        let operators = components.filter { Int($0) == nil }
        
        var lhs: Int = numbers[0]
        
        for index in 1..<numbers.count {
            guard let operation = Operation.factory(stringValue: operators[index-1]) else {
                return nil
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
