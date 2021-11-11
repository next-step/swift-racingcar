//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

//do {
//    try RacingGame().startRacingGame()
//} catch {
//    print(error)
//}


do {
    print(try InputView().inputNameOfCars())
    print(try InputView().inputNumberOfAttempts())
} catch {
    print(error)
}
