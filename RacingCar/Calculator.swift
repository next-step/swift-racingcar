//
//  Calculator.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/25.
//

import Foundation

class Calculator: Calculable {
    private var number: Int
    
    init(number: Int = 0) {
        self.number = number
    }
    
    func calculated() -> Int {
        self.number
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
