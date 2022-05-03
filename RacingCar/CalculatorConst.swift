//
//  CalculatorConst.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/04/27.
//

import Foundation

extension Calculator {
    static let plusSymbol: String = "+"
    static let minusSymbol: String = "-"
    static let multiplySymbol: String = "*"
    static let divideSymbol: String = "/"
    
    static let compatibleOperatorSymbols: [String] = [
        Calculator.plusSymbol,
        Calculator.minusSymbol,
        Calculator.multiplySymbol,
        Calculator.divideSymbol
    ]
}
