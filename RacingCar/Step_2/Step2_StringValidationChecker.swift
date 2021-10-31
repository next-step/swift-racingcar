//
//  Step2_StringValidationChecker.swift
//  RacingCar
//
//  Created by 임현규 on 2021/10/31.
//

import Foundation

struct StringCalculatorVaildationChecker: StringValidationChecker {
    private let inputString: String
    
    init(userInput: String) {
        self.inputString = userInput
    }

    func isAbleToCalculate() -> Bool {
        return isHasValidationOperator(data: operatorbleData) && isHasIntAbleString(data: intAbleData)
    }
}

extension StringCalculatorVaildationChecker {
    var operatorbleData: [String] {
        let splitStrings = inputString.split(separator: " ").map { "\($0)" }
        let operatorbleData = splitStrings.enumerated().filter { index, data in
            if index % 2 == 1 {
                return true
            }
            return false
        }.map { "\($0)" }
        return operatorbleData
    }

    var intAbleData: [String] {
        let splitStrings = inputString.split(separator: " ").map { "\($0)" }
        let intAbleStrings = splitStrings.enumerated().filter { index, data in
            if index % 2 == 0 {
                return true
            }
            return false
        }.map { "\($0)" }
        return intAbleStrings
    }
    
    func isHasValidationOperator(data: [String]) -> Bool {
        let isOperator = data
            .map { OperatorType(rawValue: $0) ?? .none }
            .filter {
            if $0 == .add || $0 == .minus || $0 == .multiple || $0 == .divide {
                return true
            }
            return false
        }
        return data.count == isOperator.count ? true : false
    }

    func isHasIntAbleString(data: [String]) -> Bool {
        let isHasIntAbleString = data
            .map { OperatorType(rawValue: $0) ?? .none }
            .filter {
            if $0 == .add || $0 == .minus || $0 == .multiple || $0 == .divide {
                return false
            }
            return true
        }
        return data.count == isHasIntAbleString.count ? true : false
    }
}
