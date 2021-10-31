//
//  Step2_StringOperation.swift
//  RacingCar
//
//  Created by 임현규 on 2021/10/29.
//

import Foundation

struct StringCalculator {
    private let userInput: String
    private let validationChecker: StringValidationChecker
    
    init(userInput: String) {
        self.userInput = userInput
        self.validationChecker = StringCalculatorVaildationChecker(userInput: userInput)
    }
    
    func startStringCalculate() -> Int {
        if validationChecker.isAbleToCalculate() {
            return calculateString(userInput: userInput)
        }
        fatalError(CalculatorError.error.description)
    }
}

extension StringCalculator {
    func calculateString(userInput data: String) -> Int {
        let splitString = userInput.split(separator: " ").map { "\($0)" }
        var result: Int?
        var operatorType: OperatorType?

        for index in 0 ... splitString.count - 1 {
            if index % 2 == 1 {
                let operatorSymbol = OperatorType(rawValue: splitString[index])
                operatorType = operatorSymbol
                continue
            }
            let number = splitString[index].toInt() ?? 0
            if let lhs = result {
                result = calculate(lhs: lhs, operatorType: operatorType ?? .none, rhs: number)
                operatorType = nil
                continue
            }
            result = number
        }
        return result ?? 0
    }

    func calculate(lhs: Int, operatorType: OperatorType, rhs: Int) -> Int {
        switch operatorType {
        case .add:
            return lhs + rhs
        case .minus:
            return lhs - rhs
        case .divide:
            return lhs / rhs
        case .multiple:
            return lhs * rhs
        case .none:
            fatalError(CalculatorError.emptyOperator.description)
        }
    }

    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }

    func minus(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }

    func multiple(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }

    func divide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
}
