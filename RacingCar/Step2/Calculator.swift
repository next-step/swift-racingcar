//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 이정배 on 2022/04/30.
//

import Foundation

class Calculator {
    func calculateStringExpression(_ input: String?) throws -> Int {
        try validateExpression(input)

        var inputArray: [String] = input!.components(separatedBy: " ")

        var result: Int = Int(inputArray.removeFirst())!

        while !inputArray.isEmpty {
            let intOperator: CalculatorOperator = try CalculatorOperator.fromString(inputArray.removeFirst())
            let operand: Int = try getOperand(inputArray.removeFirst())
            result = try intOperator.execute(result, operand)
        }

        return result
    }

    private func validateExpression(_ input: String?) throws {
        try validateNilOrBlankString(input)

        var inputArray: [String] = input!.components(separatedBy: " ")

        try validateOperand(inputArray.removeFirst())
        // 연산자, 숫자의 반복이 있어야 한다.
        while !inputArray.isEmpty {
            try CalculatorOperator.validateStringOperator(inputArray.removeFirst())
            if inputArray.isEmpty {
                throw CalculatorError.invalidOperand
            }
            try validateOperand(inputArray.removeFirst())
        }
    }

    private func validateNilOrBlankString(_ input: String?) throws {
        let trimmedInput = input?.trimmingCharacters(in: .whitespaces) ?? ""

        if trimmedInput.isEmpty {
            throw CalculatorError.nilOrBlank
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
