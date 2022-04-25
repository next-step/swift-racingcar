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
    
    func calculate(expression: String) {
        self.stack = self.splitCalcExpression(expression)
        
        let leftNumber = Int(stack.removeFirst()) ?? 0
        let `operator` = self.generateCalcOperator(stringOperator: stack.removeFirst())
        let rightNumber = Int(stack.removeFirst()) ?? 0
        
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
    }
    
    func subtract(left leftNumber: Int, right rightNumber: Int) {
        self.number = leftNumber-rightNumber
    }
    
    func multiply(left leftNumber: Int, right rightNumber: Int) {
        self.number = leftNumber*rightNumber
    }
    
    func divide(left leftNumber: Int, right rightNumber: Int) {
        self.number = leftNumber/rightNumber
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
    
    func splitCalcExpression(_ expression: String) -> [String] {
        expression.components(separatedBy: " ")
    }
}
