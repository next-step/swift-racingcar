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

extension RacingRound where Self: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.racingCars == rhs.racingCars
    }
}

struct NormalRacingRound: RacingRound, Equatable {
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
