//
//  RacingGame.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

enum RacingGameError: LocalizedError {
    case invalidCar
    
    var errorDescription: String? {
        switch self {
        case .invalidCar:
            return "RacingGame에서는 RacingCar만 참여할 수 있습니다."
        }
    }
}

struct RacingGame {
    let racingCars: [RacingCar]
    let roundCount: Int
    
    
    init(racingCars: [RacingCar], roundCount: Int) {
        self.racingCars = racingCars
        self.roundCount = roundCount
    }
    
    mutating func start() -> [RacingRound] {
        var racingResult = [RacingRound]()
        var racingRound: RacingRound = NormalRacingRound(racingCars: racingCars.copy())
        
        for _ in 0..<roundCount {
            let result: RacingRound = racingRound.start()
            racingResult.append(result)
            racingRound = result
        }
        
        return racingResult
    }
}
