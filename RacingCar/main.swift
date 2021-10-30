//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

print("계산할 표현식을 작성해주세요. ex) 2 + 3 * 4 / 2")

private let inputConsole = UserInput().inputExpression()

print(Calculator().stringCalculate(inputConsole))
