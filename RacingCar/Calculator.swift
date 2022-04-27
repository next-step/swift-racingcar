//
//  Calculator.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/25.
//

import Foundation

class Calculator: Calculable {
    private var number: Int
    private var stack: [String]
    private var count: Int
    private let characterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~!@#$%^&()_-=")
    
    enum BasicOperator {
        case add, subtract, multiply, divide, none
    }
    
    enum InputError: Error {
        case unSuppotedOperator
        case noInput
    }
    
    init(number: Int = 0, stack: [String] = [], count: Int = 0) {
        self.number = number
        self.stack = stack
        self.count = count
    }
    
    func execute(expression: String) throws {
        do {
            try self.isValidBasicOperator(input: expression)
            try self.isValidInput(input: expression)
        }
        
        let splitedCalcExpression = self.splitCalcExpression(expression)
        self.stack = splitedCalcExpression.stack
        self.count = splitedCalcExpression.count
        
        for _ in 0..<count {
            let leftNumber = Int(stack.removeFirst()) ?? 0
            let `operator` = self.generateCalcOperator(stringOperator: stack.removeFirst())
            let rightNumber = Int(stack.removeFirst()) ?? 0
            
            self.calculate(left: leftNumber, right: rightNumber, operator: `operator`)
        }
    }
    
    func calculate(left leftNumber: Int, right rightNumber: Int, operator: BasicOperator) {
        switch `operator` {
        case .add: self.add(left: leftNumber, right: rightNumber)
        case .subtract: self.subtract(left: leftNumber, right: rightNumber)
        case .multiply: self.multiply(left: leftNumber, right: rightNumber)
        case .divide: self.divide(left: leftNumber, right: rightNumber)
        case .none: break
        }
    }
    
    func calculated() -> Int {
        self.number
    }
    
    func reset() {
        self.number = 0
    }
    
    func add(left leftNumber: Int, right rightNumber: Int) {
        self.number = leftNumber+rightNumber
        self.stack.insert(String(self.number), at: 0)
    }
    
    func subtract(left leftNumber: Int, right rightNumber: Int) {
        self.number = leftNumber-rightNumber
        self.stack.insert(String(self.number), at: 0)
    }
    
    func multiply(left leftNumber: Int, right rightNumber: Int) {
        self.number = leftNumber*rightNumber
        self.stack.insert(String(self.number), at: 0)
    }
    
    func divide(left leftNumber: Int, right rightNumber: Int) {
        self.number = leftNumber/rightNumber
        self.stack.insert(String(self.number), at: 0)
    }
    
    func splitCalcExpression(_ expression: String) -> (stack: [String], count: Int) {
        let stack = expression.components(separatedBy: " ")
        let operaatorCount = expression.components(separatedBy: " ").count/2
        return (stack, operaatorCount)
    }
    
    func isValidBasicOperator(input stringOperators: String) throws {
        if stringOperators.rangeOfCharacter(from: characterSet) != nil {
            throw InputError.unSuppotedOperator
        }
    }
    
    func isValidInput(input expression: String) throws {
        if expression.isEmpty || expression == " " { throw InputError.noInput }
    }
}

private extension Calculator {
    func generateCalcOperator(stringOperator: String) -> BasicOperator {
        if stringOperator == "+" { return .add }
        if stringOperator == "-" { return .subtract }
        if stringOperator == "*" { return .multiply }
        if stringOperator == "/" { return .divide }
        return .none
    }
}
