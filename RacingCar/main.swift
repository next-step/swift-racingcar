//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

var c = Calculator()
do {
    let res = try c.input()
    print(res)
} catch {
    print(error)
}
