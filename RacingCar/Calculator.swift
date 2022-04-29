//
//  Calculator.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/29.
//

import Foundation

struct Calculator {
    func calculate(operands: [Int], operators: [Operation]) throws -> Int {
        var result = operands[0]
        
        for i in 0..<operators.count {
            result = try operators[i].operate(result, operands[i + 1])
        }
        
        return result
    }
}
