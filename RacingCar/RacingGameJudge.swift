//
//  RacingGameJudge.swift
//  RacingCar
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

protocol RacingGameJudge {
    func winner(of racingGameResult: [RacingRound]) throws -> [RacingCar]
}
    
struct NormalRacingGameJudge: RacingGameJudge {
    enum Error: LocalizedError {
        case racingGameResultIsEmpty
        
        var errorDescription: String? {
            switch self {
            case .racingGameResultIsEmpty:
                return "RacingGameResult가 비어있습니다."
            }
        }
    }
    func winner(of racingGameResult: [RacingRound]) throws -> [RacingCar] {
        guard let lastRound = racingGameResult.last else {
            throw Error.racingGameResultIsEmpty
        }
        return lastRound.winners()
    }
}

