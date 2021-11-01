//
//  ArithmeticOperationProtocol.swift
//  StringCalculator
//
//  Created by 남기범 on 2021/11/01.
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

enum CalculationError: Error {
    case inputNilOrEmpty
    case notArithmeticOperation
}

enum Operation: String {
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
}
