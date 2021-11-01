//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

func start() throws {
    let input = try UserInput().inputExpression()

    print(try Calculator().output(input))
}

do {
    try start()
} catch {
    print(error)
}



