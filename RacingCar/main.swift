//
//  RacingCar - main.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation

let input = InputView.input()
let (operations, operands) = try InputParser.parse(input)
let result = try Calculator().calculate(operators: operations, operands: operands)
OutputView.show(output: result)
