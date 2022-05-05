//
// Created by 이정배 on 2022/05/01.
//

import Foundation

enum CalculatorError: Error {
    case nilOrBlank
    case invalidOperator
    case invalidOperand
    case invalidState
    case divideByZero
}
