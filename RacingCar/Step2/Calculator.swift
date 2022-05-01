//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 이정배 on 2022/04/30.
//

import Foundation

class Calculator {
    func calculateStringExpression(_ input: String?) throws -> Int {
        try checkIsValidExpression(input)

        var inputArray: [String] = input!.components(separatedBy: " ")

        var result: Int = Int(inputArray.removeFirst())!

        while !inputArray.isEmpty {
            let intOperator: (Int, Int) throws -> Int = try getOperator(inputArray.removeFirst())
            let operand: Int = try getOperand(inputArray.removeFirst())
            result = try intOperator(result, operand)
        }

        return result
    }

    private func checkIsValidExpression(_ input: String?) throws {
        if input == nil {
            throw CalculatorError.nilOrBlank
        }
        let input: String = input!
        // 공백 문자열 확인
        if input.trimmingCharacters(in: .whitespaces).isEmpty {
            throw CalculatorError.nilOrBlank
        }
        var inputArray: [String] = input.components(separatedBy: " ")

        // 숫자로 시작되는지 확인
        _ = try getOperand(inputArray.removeFirst())
        // 연산자, 숫자의 반복이 있어야 한다.
        while !inputArray.isEmpty {
            _ = try getOperator(inputArray.removeFirst())
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

    private func getOperator(_ stringOperator: String) throws -> (Int, Int) throws -> Int {
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

    let add: (Int, Int) -> Int = {
        $0 + $1
    }

    let subtract: (Int, Int) -> Int = {
        $0 - $1
    }

    let multiply: (Int, Int) -> Int = {
        $0 * $1
    }

    let divide: (Int, Int) throws -> Int = {
        guard $1 != 0 else {
            throw CalculatorError.divideByZero
        }
        return $0 / $1
    }

}
