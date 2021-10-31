//
//  CalculatorError.swift
//  RacingCar
//
//  Created by 조민호 on 2021/10/30.
//

import Foundation

public enum CalculatorError: Int, Error {
    case valueIsNil = -1
    case valueIsEmpty = -2
    case valueHasWhiteSpace = -3
    case valueIsNotOperator = -4
    case valueIsBelowZero = -5
    case valueUnableConvetStringToInt = -6
}

extension CalculatorError {
    func message() -> String {
        var message = ""
        
        switch self {
        case .valueIsNil: message = "입력값이 없습니다."
        case .valueIsEmpty: message = "입력값이 빈 값입니다."
        case .valueHasWhiteSpace: message = "입력값에 빈 공백이 포함되어있습니다."
        case .valueIsNotOperator: message = "사칙연산 기호가 아닙니다."
        case .valueIsBelowZero: message = "1 미만으로 나눌 수 없습니다."
        case .valueUnableConvetStringToInt: message = "숫자로 변환할 수 없습니다."
        }
        
        return message
    }
}
