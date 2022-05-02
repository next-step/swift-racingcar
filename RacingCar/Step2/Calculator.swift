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
        guard let input = input else {
            throw CalculatorError.nilOrBlank
        }
        // 공백 문자열 확인
        if input.trimmingCharacters(in: .whitespaces).isEmpty {
            throw CalculatorError.nilOrBlank
        }
        var inputArray: [String] = input.components(separatedBy: " ")

        // 숫자로 시작되는지 확인
        _ = try getOperand(inputArray.removeFirst())
        // 연산자, 숫자의 반복이 있어야 한다.
        while !inputArray.isEmpty {
            _ = try CalculatorOperator.fromString(inputArray.removeFirst())
            if inputArray.isEmpty {
                throw CalculatorError.invalidOperand
            }
            _ = try getOperand(inputArray.removeFirst())
        }
    }

    private func getOperand(_ stringOperand: String) throws -> Int {
        let result = Int(stringOperand)
        if result == nil {
            throw CalculatorError.invalidOperand
        }
        return result!
    }
}
