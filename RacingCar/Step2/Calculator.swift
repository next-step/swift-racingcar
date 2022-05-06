//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 이정배 on 2022/04/30.
//

import Foundation

class Calculator {

    func calculateStringExpression(_ input: String?) throws -> Int {
        try validateNilOrBlankString(input)

        var seperatedInput: [String] = input!.components(separatedBy: " ")
        var result = CalculatorState.initialState

        while !seperatedInput.isEmpty {
            result = try result.getNextState(input: seperatedInput.removeFirst())
        }

        return try result.getCompletedResult()
    }

    private func validateNilOrBlankString(_ input: String?) throws {
        let trimmedInput = input?.trimmingCharacters(in: .whitespaces) ?? ""

        if trimmedInput.isEmpty {
            throw CalculatorError.nilOrBlank
        }
    }
}
