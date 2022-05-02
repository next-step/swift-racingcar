//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 이정배 on 2022/04/30.
//

import Foundation

/// 기능 요구 사항
/// 사용자가 입력한 문자열 값에 따라 사칙연산을 수행할 수 있는 계산기를 구현해야 합니다.
/// 입력 문자열의 숫자와 사칙 연산자 사이에는 반드시 빈 공백 문자열이 있다고 가정합니다.
/// 나눗셈의 경우 결과 값을 정수로 떨어지는 값으로 한정합니다.
/// 문자열 계산기는 사칙연산의 계산 우선순위가 아닌 입력 값에 따라 계산 순서가 결정됩니다.
/// 즉, 수학에서는 곱셈, 나눗셈이 덧셈, 뺄셈 보다 먼저 계산해야 하지만 이를 무시합니다.
/// 예를 들어 2 + 3 * 4 / 2와 같은 문자열을 입력할 경우 2 + 3 * 4 / 2 실행 결과인 10을 출력해야 합니다.

class Calculator {
    func calculateStringExpression(_ input: String?) throws -> Int {
        try validateExpression(input)

        var seperatedInput: [String] = input!.components(separatedBy: " ")

        var result: Int = Int(seperatedInput.removeFirst())!

        while !seperatedInput.isEmpty {
            let intOperator: CalculatorOperator = try CalculatorOperator.fromString(seperatedInput.removeFirst())
            let operand: Int = try getOperand(seperatedInput.removeFirst())
            result = try intOperator.execute(result, operand)
        }

        return result
    }

    private func validateExpression(_ input: String?) throws {
        try validateNilOrBlankString(input)

        var seperatedInput: [String] = input!.components(separatedBy: " ")

        try validateOperand(seperatedInput.removeFirst())
        while !seperatedInput.isEmpty {
            try CalculatorOperator.validateStringOperator(seperatedInput.removeFirst())
            if seperatedInput.isEmpty {
                throw CalculatorError.invalidOperand
            }
            try validateOperand(seperatedInput.removeFirst())
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
