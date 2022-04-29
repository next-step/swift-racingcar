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
    case operatorError
    case numberError
    case calculatorError
    
    
    var errorDescription: String {
        switch self {
        case .inputNil:
            return "입력값이 nil 입니다."
        case .inputEmpty:
            return "입력값이 빈 값입니다."
        case .operatorError:
            return "사칙연산이 아닙니다"
        case .numberError:
            return "숫자가 아닙니다"
        case .calculatorError:
            return "계산 불가합니다"
        }
    }
}
