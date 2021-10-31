//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func start() {
    let input = UserInput().inputExpression()

    print(Calculator().stringCalculate(input))
}

start()


