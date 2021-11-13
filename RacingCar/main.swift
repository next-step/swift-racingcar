//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

do {
    let nameOfCars = try InputView().inputNameOfCars()
    try RacingGame().startRacingGame(input: nameOfCars)
} catch {
    print(error)
}
