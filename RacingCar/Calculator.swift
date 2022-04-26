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
    
    enum CalcOperator {
        case add, subtract, multiply, divide, none
    }
    
    init(number: Int = 0, stack: [String] = [], count: Int = 0) {
        self.number = number
        self.stack = stack
        self.count = count
    }
    
    func execute(expression: String) {
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
    
    func calculate(left leftNumber: Int, right rightNumber: Int, operator: CalcOperator) {
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
}

private extension Calculator {
    func generateCalcOperator(stringOperator: String) -> CalcOperator {
        if stringOperator == "+" { return .add }
        if stringOperator == "-" { return .subtract }
        if stringOperator == "*" { return .multiply }
        if stringOperator == "/" { return .divide }
        return .none
    }
}
