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
    let race = Race(carCount: carCount, roundCount: raceCount)
    
    for _ in 0..<raceCount {
        try race.run()
    }
} catch {
    print(error)
}
