//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let inputView = InputView()
let resultView = ResultView()
do {
    let carCount: Int = try inputView.getCarCount()
    let raceCount: Int = try inputView.getRaceCount()
    let race = Race(carCount: carCount, roundCount: raceCount)
    
    resultView.printTitle()
    
    for _ in 0..<raceCount {
        try race.run()
        let currentStates = race.getCurrentStates()
        resultView.printResult(result: currentStates)
    }
} catch {
    print(error)
}
