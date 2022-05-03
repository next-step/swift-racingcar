//
//  StringCalculatorError.swift
//  RacingCar
//
//  Created by brian은석 on 2022/04/28.
//

import Foundation

enum StringCalculatorError: Error {
    case inputNil
    case inputEmpty
<<<<<<< HEAD
    case isNotOperator
    case number
    case calculator
=======
    case operatorError
    case numberError
    case calculatorError
>>>>>>> a694801 (feat: Make stringCalculator)
    
    
    var errorDescription: String {
        switch self {
        case .inputNil:
            return "입력값이 nil 입니다."
        case .inputEmpty:
            return "입력값이 빈 값입니다."
<<<<<<< HEAD
        case .isNotOperator:
            return "사칙연산이 아닙니다"
        case .number:
            return "숫자가 아닙니다"
        case .calculator:
=======
        case .operatorError:
            return "사칙연산이 아닙니다"
        case .numberError:
            return "숫자가 아닙니다"
        case .calculatorError:
>>>>>>> a694801 (feat: Make stringCalculator)
            return "계산 불가합니다"
        }
    }
}
