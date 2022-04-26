//
//  StringCalculator.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/26.
//

import Foundation

struct StringCalculator {
    
    private var numbers: [Int] = []
    private var operators: [String] = []
    
    private let basicOperators: [String] = ["+", "-", "*", "/"]
    
    mutating func runWithUserInput() throws -> Int {
        clearData()
        try split(mathExpression: input())
        guard let result = operate() else {
            throw StringCalculatorError.calculateError
        }
        return result
    }
    
    mutating func runWithTest(expression: String?) throws -> Int {
        clearData()
        try split(mathExpression: expression)
        guard let result = operate() else {
            throw StringCalculatorError.calculateError
        }
        return result
    }
    
    func input() -> String? {
        return readLine()
    }
    
    private mutating func clearData() {
        numbers.removeAll()
        operators.removeAll()
    }
    
    private mutating func split(mathExpression: String?) throws {
        let expression = try checkNil(mathExpression)
        try checkEmpty(expression)
        try checkVaildExpression(expression)
        
        try expression.components(separatedBy: " ")
            .forEach { value in
                if let number = Int(value) {
                    numbers.append(number)
                } else {
                    guard basicOperators.contains(value) else { throw StringCalculatorError.invalidOperator }
                    operators.append(value)
                }
            }
    }
    
    private func operate() -> Int? {
        var previous: Int?
        var numberPointer: Int = 0, operatorPointer: Int = 0
        while numberPointer != numbers.count {
            if let number = previous {
                previous = calculate(number,
                                     numbers[numberPointer],
                                     operators[operatorPointer])
            } else {
                previous = calculate(numbers[numberPointer],
                                     numbers[numberPointer + 1],
                                     operators[operatorPointer])
                numberPointer += 1
            }
            numberPointer += 1
            operatorPointer += 1
        }
        return previous
    }
    
    private func calculate(_ lhs: Int, _ rhs: Int, _ operator: String) -> Int? {
        switch `operator` {
        case "+":
            return add(lhs, rhs)
        case "-":
            return subtraction(lhs, rhs)
        case "*":
            return multiply(lhs, rhs)
        case "/":
            return division(lhs, rhs)
        default:
            return nil
        }
    }
}
// MARK: - Operator methods
extension StringCalculator {
    
    private func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    private func subtraction(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    private func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    private func division(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
}
// MARK: - Check conditions
extension StringCalculator {
    
    private func checkNil(_ expression: String?) throws -> String {
        guard let expression = expression else {
            throw StringCalculatorError.passNil
        }
        return expression
    }
    
    private func checkEmpty(_ expression: String) throws {
        guard !expression.isEmpty else {
            throw StringCalculatorError.passEmpty
        }
    }
    
    private func checkVaildExpression(_ expression: String) throws {
        guard let lastCharacter = expression.last,
              !basicOperators.contains(String(lastCharacter)) else {
            throw StringCalculatorError.lastValueIsNotNumber
        }
    }
}
