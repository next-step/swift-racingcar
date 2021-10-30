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
