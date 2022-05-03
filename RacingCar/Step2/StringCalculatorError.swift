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
=======
    case `operator`
>>>>>>> 742e65c (fix: Step2 reflect what has been reviewed)
    case number
    case calculator
    
    
    var errorDescription: String {
        switch self {
        case .inputNil:
            return "입력값이 nil 입니다."
        case .inputEmpty:
            return "입력값이 빈 값입니다."
<<<<<<< HEAD
        case .isNotOperator:
=======
        case .operator:
>>>>>>> 742e65c (fix: Step2 reflect what has been reviewed)
            return "사칙연산이 아닙니다"
        case .number:
            return "숫자가 아닙니다"
        case .calculator:
            return "계산 불가합니다"
        }
    }
}
