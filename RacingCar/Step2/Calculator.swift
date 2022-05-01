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

        throw CalculatorError.notImplemented
    }

    private func checkIsValidExpression(_ input: String?) throws {
        if (input ?? "").isEmpty {
            throw CalculatorError.nilOrEmpty
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
