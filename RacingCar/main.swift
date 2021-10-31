//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let userInput = readLine()

guard let userInput = userInput else { fatalError(CalculatorError.inputNil.description) }
guard userInput.isNotEmpty() else { fatalError(CalculatorError.emptyString.description) }

print(StringCalculator(userInput: userInput).startStringCalculate)
