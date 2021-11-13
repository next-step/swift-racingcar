//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

let nameOfCars = try InputView().inputNameOfCars()
let numberOfAttempts = try InputView().inputNumberOfAttempts()

do {
    try RacingGame().startRacingGame(nameOfCars: nameOfCars, numberOfAttempts: numberOfAttempts)
} catch {
    print(error)
}
