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
    case `operator`
    case number
    case calculator
    
    
    var errorDescription: String {
        switch self {
        case .inputNil:
            return "입력값이 nil 입니다."
        case .inputEmpty:
            return "입력값이 빈 값입니다."
        case .operator:
            return "사칙연산이 아닙니다"
        case .number:
            return "숫자가 아닙니다"
        case .calculator:
            return "계산 불가합니다"
        }
    }
}
