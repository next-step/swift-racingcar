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
    case notOperator   // 연산자가 없다
    case numberNotExist
    case operatorNotExist
}

struct Calculator {
    
    var inputs: [String]?
    
    var opCode: String?
    var previous: Int?
    var result: Int = 0
    
    /// 동작
    mutating func input() throws -> Int {
        print("> ", terminator: "")
        inputs = readLine()?.components(separatedBy: " ")
        return try drive()
    }
    
    private mutating func drive() throws -> Int {
        guard let inputs = inputs else { throw CalculatorError.noInput }
        
        for input in inputs {
            try parseInput(input: input)
        }
        return result
    }
    
    private mutating func parseInput(input: String) throws {
        if let number = Int(input) {
            if previous == nil {
                previous = number
            }
            guard let previous = previous else { throw CalculatorError.numberNotExist }
            guard let opCode = opCode else { throw CalculatorError.operatorNotExist }
            
            self.previous = try calc(previous: previous, opCode: opCode, number: number)
            self.opCode = nil
            
        } else {
            // 숫자가 아니면
            opCode = try parseOpcode(input: input)
        }
    }
    
    private func parseNumber(input: String) throws -> Int {
        guard let number = Int(input) else { throw CalculatorError.notNumber }
        return number
    }
    
    private func parseOpcode(input: String) throws -> String {
        if ["+", "-", "*", "/"].contains(input) {
            return input
        }
        throw CalculatorError.notOperator
    }
    
    private mutating func calc(previous: Int, opCode: String, number: Int) throws -> Int {
        switch opCode {
        case "+": result = add(previous, number)
        case "-": result = substract(previous, number)
        case "*": result = multiply(previous, number)
        case "/": result = divide(previous, number)
        default: throw CalculatorError.notOperator
        }
        return result
    }
    
    /// 기능
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
