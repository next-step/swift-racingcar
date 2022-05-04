//
//  Round.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

protocol RacingRound {
    var racingCars: [RacingCar] { get }
    func start() -> RacingRound
}

struct NormalRacingRound: RacingRound {
    let racingCars: [RacingCar]
    
    init(racingCars: [RacingCar]) {
        self.racingCars = racingCars
    }
    
    func start() -> RacingRound {
        let copiedCars = racingCars.copy()
        copiedCars.forEach { $0.move() }
        return NormalRacingRound(racingCars: copiedCars)
    }
}
