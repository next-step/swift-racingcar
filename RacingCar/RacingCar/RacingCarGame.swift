//
//  RacingCarGame.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/10.
//

import Foundation

struct RacingCarGame {
    private let randomNumber: RandomNumber
    private var racingCarDrivers: [RacingCarDriver]
    
    init(randomNumber: RandomNumber, racingCarDrivers: [RacingCarDriver]) {
        self.randomNumber = randomNumber
        self.racingCarDrivers = racingCarDrivers
    }
    
    var racingCarPositions: [Position] {
        racingCarDrivers.map { $0.racingCarPosition }
    }
    
    mutating func tryMovingRacingCarsWithRandomNumbers() {
        racingCarDrivers.indices.forEach {
            racingCarDrivers[$0].tryMoving(with: randomNumber.value)
        }
    }
}
