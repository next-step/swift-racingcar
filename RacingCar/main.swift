//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

//MARK: - Calculator
let calculator: Calculable = Calculator()
try calculator.execute(expression: CalculatorInput.readExpression())
