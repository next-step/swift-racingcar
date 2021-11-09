//
//  RacingCarGame.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/10.
//

import Foundation

struct RacingCarGame {
    let randomRange: Range<Int>
    private var racingCarMovers: [RacingCarMover]
    
    init(randomRange: Range<Int>, racingCarMovers: [RacingCarMover]) {
        self.randomRange = randomRange
        self.racingCarMovers = racingCarMovers
    }
    
    var racingCarPositions: [Position] {
        racingCarMovers.map { $0.racingCarPosition }
    }
    
    mutating func tryMovingRacingCarsWithRandomNumbers() {
        racingCarMovers.indices.forEach {
            racingCarMovers[$0].tryMoving(with: Int.random(in: randomRange))
        }
    }
}
