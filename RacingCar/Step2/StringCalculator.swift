//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 이정배 on 2022/04/30.
//

import Foundation

class StringCalculator {
    func calculate(_ input: String?) throws -> Int {
        try checkIsValidExpression(input)

        throw StringCalculatorError.notImplemented
    }

    private func checkIsValidExpression(_ input: String?) throws {
        if (input ?? "").isEmpty {
            throw StringCalculatorError.nilOrEmpty
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

    let divide: (Int, Int) -> Int = {
        $0 / $1
    }

}
