//
//  RacingCar - main.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation

let input = InputView.input()
let (operations, operands) = try InputParser.parse(input)
let result = try Calculator().calculate(operands: operands, operators: operations)
OutputView.show(output: result)
