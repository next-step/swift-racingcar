//
//  Calculator.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/04/27.
//

import Foundation

class Calculator: NSObject {
    let formula: String
    
    var numbers: [Int] = []
    var operators: [String] = []
    
    var result: Int?
    
    init(for formula: String) {
        self.formula = formula
        super.init()
        self.seperateByBlankCharacter()
    }
    
    func seperateByBlankCharacter() {
        let seperatedFormula = self.formula.components(separatedBy: " ")
        
        let orderedNumbers = seperatedFormula
            .filter { !CalculatorConst.listOfOperator.contains($0) }
            .compactMap { Int($0) }
        
        let orderedOperators = seperatedFormula
            .filter { CalculatorConst.listOfOperator.contains($0) }
        
        self.numbers = orderedNumbers
        self.operators = orderedOperators
    }
    
    func calculate() -> Int {
        
        let lhs = self.numbers.removeFirst()
        let rhs = self.numbers.removeFirst()
        
        let operatorSymbol = self.operators.removeFirst()
        
        return operate(by: operatorSymbol, lhs: lhs, rhs: rhs)
    }
    
    func operate(by operatorSymbol: String, lhs: Int, rhs: Int) -> Int {
        switch operatorSymbol {
        case "+":
            return add(lhs: lhs, rhs: rhs)
        default:
            return 0
        }
    }
}

extension Calculator {
    func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
}
