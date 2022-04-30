//
//  Round.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

protocol RacingRound {
    func start() -> RacingRoundResult
}

struct NormalRacingRound: RacingRound {
    private var racingCars: [RacingCar]
    
    init(racingCars: [RacingCar]) {
        self.racingCars = racingCars
    }
    
    func start() -> RacingRoundResult {
        racingCars.forEach { $0.move() }
        return .init(racingCars: racingCars)
    }
}
