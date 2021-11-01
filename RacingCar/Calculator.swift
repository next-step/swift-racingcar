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
    case inputIsNotValid
}

struct Calculator {
    
    var result: Int?
    var opCode: String?
    
    /// 동작
    mutating func input(str: String) throws -> Int {
        let inputs = str.components(separatedBy: " ")
        return try drive(inputs: inputs)
    }
    
    private mutating func drive(inputs: [String]) throws -> Int {
        guard inputs.count > 2 else { throw CalculatorError.inputIsNotValid }
        
        var inputs = inputs
        result = parseNumber(input: inputs.removeFirst())
        opCode = parseOpcode(input: inputs.removeFirst())
        
        for input in inputs {
            try processInput(input: input)
        }
        return result ?? 0
    }
    
    private mutating func processInput(input: String) throws {
        // 숫자이면
        if let number = parseNumber(input: input) {
            guard let previous = result else { throw CalculatorError.numberNotExist }
            guard let opCode = opCode else { throw CalculatorError.operatorNotExist }
                
            self.result = try calc(previous: previous, opCode: opCode, number: number)
            self.opCode = nil
        }
        
        // 숫자가 아니면
        opCode = parseOpcode(input: input)
    }
    
    private mutating func parseNumber(input: String) -> Int? {
        return Int(input)
    }
    
    private func parseOpcode(input: String) -> String? {
        if ["+", "-", "*", "/"].contains(input) {
            return input
        }
        return nil
    }
    
    private mutating func calc(previous: Int, opCode: String, number: Int) throws -> Int? {
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
