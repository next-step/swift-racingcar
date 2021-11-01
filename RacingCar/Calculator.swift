//
//  Calculator.swift
//  RacingCar
//
//  Created by sangsun on 2021/10/29.
//

import Foundation

enum CalculatorError: Error {
    case noInput
    case notNumber  // 숫자가 없다
    case notOoperator   // 연산자가 없다
}

struct Calculator {
    
    var inputs: [String]?
    
    var opCode: String?
    var previous: Int?
    var result: Int = 0
    
    /// Helper
    mutating func input() throws {
        inputs = readLine()?.components(separatedBy: " ")
        try drive()
    }
    
    private mutating func drive() throws {
        guard let inputs = inputs else { throw CalculatorError.noInput }
        
        for input in inputs {
            if let number = Int(input) {
                // 숫자이면
                if previous == nil {
                    previous = number
                } else {
                    guard let previous = previous else { throw CalculatorError.notNumber }
                    guard let opCode = opCode else { throw CalculatorError.notOoperator }
                    
                    switch opCode {
                    case "+": result = add(previous, number)
                    case "-": result = substract(previous, number)
                    case "*": result = multiply(previous, number)
                    case "/": result = divide(previous, number)
                    default:
                        throw CalculatorError.notOoperator
                    }
                    self.previous = result
                    self.opCode = nil
                }
            } else {
                // 숫자가 아니면
                if ["+", "-", "*", "/"].contains(input) {
                    opCode = input
                } else {
                    throw CalculatorError.notOoperator
                }
            }
        }
        print(result)
    }
    
    /// Function
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func divide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
    
}
