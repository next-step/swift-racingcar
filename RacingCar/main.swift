//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

print("계산할 문자열을 입력해주세요. ex) 2 + 3 * 4 / 2")

let input = UserInput().inputExpression()

guard let input = input else {
    fatalError(CalculatorError.valueIsNil.message())
}

guard !input.isEmpty else {
    fatalError(CalculatorError.valueIsEmpty.message())
}

print(Calculator().stringCalculate(input))
