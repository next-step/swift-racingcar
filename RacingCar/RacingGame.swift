//
//  RacingGame.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

struct RacingGame {
    let racingRound: [RacingRound]
    
    init(racingCars: [RacingCar], roundCount: Int) {
        racingRound = (0..<roundCount).map { _ in NormalRacingRound(racingCars: racingCars) }
    }
    
    func start() -> RacingGameResult {
        let racingRoundResults = racingRound.map { $0.start() }
        return RacingGameResult(racingRoundResut: racingRoundResults)
    }
}
