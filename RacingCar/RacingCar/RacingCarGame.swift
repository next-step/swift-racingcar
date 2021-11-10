//
//  RacingCarGame.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/10.
//

import Foundation

struct RacingCarGame {
    let randomRange: Range<Int>
    private var racingCarDrivers: [RacingCarDriver]
    
    init(randomRange: Range<Int>, racingCarDrivers: [RacingCarDriver]) {
        self.randomRange = randomRange
        self.racingCarDrivers = racingCarDrivers
    }
    
    var racingCarPositions: [Position] {
        racingCarDrivers.map { $0.racingCarPosition }
    }
    
    mutating func tryMovingRacingCarsWithRandomNumbers() {
        racingCarDrivers.indices.forEach {
            racingCarDrivers[$0].tryMoving(with: Int.random(in: randomRange))
        }
    }
}
