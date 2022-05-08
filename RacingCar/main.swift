//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let gameController = GameController()
do {
    let gameSetting = try gameController.gameSetting()
    let cars = gameController.carGenerator(gameSetting.carNames)
    gameController.gameResult(cars, gameSetting.attemptCount)
    
} catch let error as InputError {
    error.showError()
}

