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
            try self.isValidInput(input: expression)
        }
        
        let splitedCalcExpression = self.splitCalcExpression(expression)
        self.stack = splitedCalcExpression.stack
        self.count = splitedCalcExpression.count
        
        for _ in 0..<count {
            let leftOperand = Int(stack.removeFirst()) ?? 0
            let `operator` = try self.generateBasicOperator(stringOperator: stack.removeFirst())
            let rightOperand = Int(stack.removeFirst()) ?? 0
            
            self.calculate(left: leftOperand, right: rightOperand, operator: `operator`)
        }
    }
    
    func calculate(left leftOperand: Int, right rightOperand: Int, operator: BasicOperator) {
        switch `operator` {
        case .add: self.add(left: leftOperand, right: rightOperand)
        case .subtract: self.subtract(left: leftOperand, right: rightOperand)
        case .multiply: self.multiply(left: leftOperand, right: rightOperand)
        case .divide: self.divide(left: leftOperand, right: rightOperand)
        case .none: break
        }
    }
    
    func calculated() -> Int {
        self.number
    }
    
    func reset() {
        self.number = 0
    }
    
    func add(left leftOperand: Int, right rightOperand: Int) {
        self.number = leftOperand+rightOperand
        self.stack.insert(String(self.number), at: 0)
    }
    
    func subtract(left leftOperand: Int, right rightOperand: Int) {
        self.number = leftOperand-rightOperand
        self.stack.insert(String(self.number), at: 0)
    }
    
    func multiply(left leftOperand: Int, right rightOperand: Int) {
        self.number = leftOperand*rightOperand
        self.stack.insert(String(self.number), at: 0)
    }
    
    func divide(left leftOperand: Int, right rightOperand: Int) {
        self.number = leftOperand/rightOperand
        self.stack.insert(String(self.number), at: 0)
    }
    
    func splitCalcExpression(_ expression: String) -> (stack: [String], count: Int) {
        let stack = expression.components(separatedBy: " ")
        let operaatorCount = expression.components(separatedBy: " ").count/2
        return (stack, operaatorCount)
    }
    
    func isValidInput(input expression: String) throws {
        if expression.isEmpty || expression == " " { throw InputError.noInput }
    }
}

private extension Calculator {
    func generateBasicOperator(stringOperator: String) throws -> BasicOperator {
        if stringOperator == "+" { return .add }
        if stringOperator == "-" { return .subtract }
        if stringOperator == "*" { return .multiply }
        if stringOperator == "/" { return .divide }
        
        throw InputError.unSuppotedOperator
    }
}
