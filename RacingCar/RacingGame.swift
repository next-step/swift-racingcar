//
//  RacingGame.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

enum RacingGameError: LocalizedError {
    case invalidRacingCarCount(Int)
    case invalidRoundCarCount(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidRacingCarCount(let invalidCount):
            return "RacingGame에서는 RacingCar만 참여할 수 있습니다. 입력된 racingCar 개수: \(invalidCount)"
        case .invalidRoundCarCount(let invalidCount):
            return "RacingGame은 0개 이상의 RacingCar만 가질 수 있습니다. 입력된 RacingCars의 개수: \(invalidCount)"
        }
    }
}

struct RacingGame {
    static let minRacingCarCount = 1
    static let minRoundCount = 1
    
    let racingCars: [RacingCar]
    let roundCount: Int
    
    init(racingCars: [RacingCar], roundCount: Int) throws {
        if racingCars.count < RacingGame.minRacingCarCount {
            throw RacingGameError.invalidRacingCarCount(racingCars.count)
        }
        
        if roundCount < RacingGame.minRoundCount {
            throw RacingGameError.invalidRoundCarCount(roundCount)
        }
        
        self.racingCars = racingCars
        self.roundCount = roundCount
    }
    
    mutating func start() -> [RacingRound] {
        var racingResult = [RacingRound]()
        var racingRound: RacingRound = try! NormalRacingRound(racingCars: racingCars.copy())
        
        for _ in 0..<roundCount {
            let result: RacingRound = racingRound.start()
            racingResult.append(result)
            racingRound = result
        }
        
        return racingResult
    }
}
