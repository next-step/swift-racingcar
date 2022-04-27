//
//  Calculator.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/04/27.
//

import Foundation

struct Calculator {
    let formula: String
    
    var numbers: [Int] = []
    var operators: [String] = []
    
    init(for formula: String) {
        self.formula = formula
    }
    
    mutating func seperateByBlankCharacter() {
        let seperatedFormula = self.formula.components(separatedBy: " ")
        
        let orderedNumbers = seperatedFormula
            .filter { !CalculatorConst.listOfOperator.contains($0)}
            .compactMap { Int($0) }
        
        let orderedOperators = seperatedFormula
            .filter { CalculatorConst.listOfOperator.contains($0) }
        
        self.numbers = orderedNumbers
        self.operators = orderedOperators
    }
}
