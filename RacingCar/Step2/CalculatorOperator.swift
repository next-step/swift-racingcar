//
// Created by 이정배 on 2022/05/02.
//

import Foundation

enum CalculatorOperator {
    case add
    case subtract
    case multiply
    case divide
}

extension CalculatorOperator {
    func execute(_ a: Int, _ b: Int) throws -> Int {
        switch self {
        case .add:
            return a + b
        case .subtract:
            return a - b
        case .multiply:
            return a * b
        case .divide:
            guard b != 0 else {
                throw CalculatorError.divideByZero
            }
            return a / b
        }
    }
}

extension CalculatorOperator {
    static func fromString(_ stringOperator: String) throws -> CalculatorOperator {
        try validateStringOperator(stringOperator)
        switch stringOperator {
        case "+":
            return add
        case "-":
            return subtract
        case "*":
            return multiply
        case "/":
            return divide
        default:
            throw CalculatorError.invalidOperator
        }
    }
}

extension CalculatorOperator {
    static func validateStringOperator(_ stringOperator: String) throws {
        switch stringOperator {
        case "+":
            return
        case "-":
            return
        case "*":
            return
        case "/":
            return
        default:
            throw CalculatorError.invalidOperator
        }
    }
}
