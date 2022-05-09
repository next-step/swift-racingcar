//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let inputView = InputView()
do {
    let carCount: Int = try inputView.getCarCount()
    let raceCount: Int = try inputView.getRaceCount()
    
    print(carCount)
    print(raceCount)
} catch {
    print(error)
}
