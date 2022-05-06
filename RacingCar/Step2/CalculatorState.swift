//
// Created by 이정배 on 2022/05/05.
//

import Foundation


enum CalculatorState {
    case initialState
    case completed(currentValue: Int)
    case waiting(currentValue: Int, currentOperator: CalculatorOperator)
}

extension CalculatorState {
    func getCompletedResult() throws -> Int {
        if case .completed(currentValue: let currentValue) = self {
            return currentValue
        }
        throw CalculatorError.invalidState
    }

    func getNextState(input: String) throws -> CalculatorState {
        switch self {

        case .initialState:
            let inputOperand = try getOperand(input)
            return .completed(currentValue: inputOperand)

        case .completed(currentValue: let currentValue):
            guard let inputOperator = CalculatorOperator(rawValue: input) else {
                throw CalculatorError.invalidOperator
            }
            return .waiting(currentValue: currentValue, currentOperator: inputOperator)

        case .waiting(currentValue: let currentValue, currentOperator: let currentOperator):
            let inputOperand = try getOperand(input)
            let result = try currentOperator.execute(currentValue, inputOperand)
            return .completed(currentValue: result)
        }
    }

    private func validateOperand(_ stringOperand: String) throws {
        let operand = Int(stringOperand)

        if operand == nil {
            throw CalculatorError.invalidOperand
        }
    }

    private func getOperand(_ stringOperand: String) throws -> Int {
        try validateOperand(stringOperand)

        return Int(stringOperand)!
    }
}
