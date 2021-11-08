//
//  Calculator.swift
//  RacingCar
//
//  Created by sangsun on 2021/10/29.
//

import Foundation

enum CalculatorError: Error {
    case notOperator        // 입력값에 연산자가 없음
    case numberNotExist     // 먼저 입력된 숫자가 존재하지 않음
    case operatorNotExist   // 현재 저장된 연산자가 존재하지 않음
    case inputIsNotValid    // 입력값이 올바르지 않음
    case divideByZero       // 0으로 나눌 수 없음
}

struct Calculator {
    
    var result: Int?
    var operatorCode: String?
    
    /// 동작
    mutating func input(str: String) throws -> Int {
        let inputs = str.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
        return try calculate(inputs: inputs)
    }
    
    private mutating func calculate(inputs: [String]) throws -> Int {
        guard inputs.count >= 3 else { throw CalculatorError.inputIsNotValid }
        
        var inputs = inputs
        result = parseNumber(input: inputs.removeFirst())
        operatorCode = parseOpcode(input: inputs.removeFirst())
        
        for input in inputs {
            try processInput(input: input)
        }
        return result ?? 0
    }
    
    private mutating func processInput(input: String) throws {
        // 숫자이면
        if let number = parseNumber(input: input) {
            guard let previous = result else { throw CalculatorError.numberNotExist }
            guard let opCode = operatorCode else { throw CalculatorError.operatorNotExist }
                
            self.result = try calc(previous: previous, opCode: opCode, number: number)
            self.operatorCode = nil
        }
        
        // 숫자가 아니면
        operatorCode = parseOpcode(input: input)
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
        case "/": result = try divide(previous, number)
        default: throw CalculatorError.notOperator
        }
        return result
    }
    
    /// 기능
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func divide(_ lhs: Int, _ rhs: Int) throws -> Int {
        if rhs == 0 {
            throw CalculatorError.divideByZero
        }
        return lhs / rhs
    }
    
}
