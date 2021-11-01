//
//  ExpressionUnitCalculator.swift
//  RacingCar
//
//  Created by itzel.du on 2021/10/31.
//

import Foundation

struct ExpressionUnitCalculator {
    private let lhs: Int
    private let operation: Operation
    private let rhs: Int
    
    init(lhs: Int, operation: Operation, rhs: Int) {
        self.lhs = lhs
        self.operation = operation
        self.rhs = rhs
    }
    
    func calculate() -> Int {
        switch operation {
        case .addition: return lhs + rhs
        case .subtraction: return lhs - rhs
        case .multiplication: return lhs * rhs
        case .devision: return lhs / rhs
        }
    }
    
    enum Operation {
        case addition, subtraction, multiplication, devision
        
        init?(operation: String) {
            switch operation {
            case "+": self = .addition
            case "-": self = .subtraction
            case "*": self = .multiplication
            case "/": self = .devision
            default: return nil
            }
        }
    }
}

extension ExpressionUnitCalculator {
    init(_ expressionUnit: [String]) throws {
        guard
            expressionUnit.count == 3,
            let lhs = Int(expressionUnit[0]),
            let operation = Operation(operation: expressionUnit[1]),
            let rhs = Int(expressionUnit[2])
        else { throw ExpressionInputError.notOperation }
        
        self.lhs = lhs
        self.operation = operation
        self.rhs = rhs
    }
}
