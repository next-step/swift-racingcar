//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func start() throws {
    let input = try UserInput().inputExpression()
    
    print("계산 결과는 \(try Calculator().output(input)) 입니다.")
}

do {
    try start()
} catch {
    switch error {
    case CalculatorError.valueIsNil:
        print("\(CalculatorError.valueIsNil.message()) 다시 입력해주세요.")
    case CalculatorError.valueIsEmpty:
        print("\(CalculatorError.valueIsEmpty.message()) 다시 입력해주세요.")
    case CalculatorError.valueHasWhiteSpace:
        print("\(CalculatorError.valueHasWhiteSpace.message()) 다시 입력해주세요.")
    case CalculatorError.valueIsNotOperator:
        print("\(CalculatorError.valueIsNotOperator.message()) 다시 입력해주세요.")
    case CalculatorError.valueIsBelowZero:
        print("\(CalculatorError.valueIsBelowZero.message()) 다시 입력해주세요.")
    case CalculatorError.valueUnableConvetStringToInt:
        print("\(CalculatorError.valueUnableConvetStringToInt.message()) 다시 입력해주세요.")
    case CalculatorError.valueIsBelowMinimumCount:
        print("\(CalculatorError.valueIsBelowMinimumCount.message()) 다시 입력해주세요.")
    default:
        print("다시 입력해주세요.")
    }
}



