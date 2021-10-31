//
//  Step2_calculatorError.swift
//  RacingCar
//
//  Created by 임현규 on 2021/10/31.
//

import Foundation

enum CalculatorError: Error {
    case inputNil
    case emptyString
    case emptyOperator
    case error
    case convertError

    var description: String {
        switch self {
        case .inputNil: return "inputNil"
        case .emptyString: return "emptyString"
        case .emptyOperator: return "empty Operator"
        case .error: return "can not Calculate"
        case .convertError: return "can not convert"
        }
    }
}
