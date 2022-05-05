//
// Created by 이정배 on 2022/05/02.
//

import Foundation

enum CalculatorOperator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
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
