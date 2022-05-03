//
//  Calculator.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/04/27.
//

import Foundation

public class Calculator {
    private let formula: String
    
    private var numbers: [Int] = []
    private var operators: [String] = []
    
    private var result: Int = 0
    
    init(for formula: String) {
        self.formula = formula
        self.seperateByBlankCharacter()
    }
    
    private func seperateByBlankCharacter() {
        let seperatedFormula = self.formula.components(separatedBy: " ")
        
        let orderedNumbers = seperatedFormula
            .filter { !CalculatorConst.listOfOperator.contains($0) }
            .compactMap { Int($0) }
        
        let orderedOperators = seperatedFormula
            .filter { CalculatorConst.listOfOperator.contains($0) }
        
        self.numbers = orderedNumbers
        self.operators = orderedOperators
    }
    
    public func calculate() throws -> Int {
        if let error = catchError() { throw error }
        
        self.result = self.numbers.removeFirst()
        while !numbers.isEmpty {
            let lhs = self.result
            let rhs = self.numbers.removeFirst()
            let operatorSymbol = self.operators.removeFirst()
            
            self.result = operate(by: operatorSymbol, lhs: lhs, rhs: rhs)
        }
        return self.result
    }
    
    private func operate(by operatorSymbol: String, lhs: Int, rhs: Int) -> Int {
        switch operatorSymbol {
        case "+":
            return add(lhs: lhs, rhs: rhs)
        case "-":
            return minus(lhs: lhs, rhs: rhs)
        case "*":
            return multiply(lhs: lhs, rhs: rhs)
        case "/":
            return divide(lhs: lhs, rhs: rhs)
        default:
            return 0
        }
    }
    
    private func catchError() -> CalculatorError? {
        guard !formula.isEmpty else { return .emptyFormula }
        guard !numbers.isEmpty else { return .invalidFormula }
        
        guard numbers.count - 1 == operators.count else { return .invalidFormula }
        return nil
    }
}

extension Calculator {
    private func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    private func minus(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    private func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
    private func divide(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
}

public enum CalculatorError: Error {
    case emptyFormula
    case invalidFormula
}
