//
//  RacingGameJudge.swift
//  RacingCar
//
//  Created by nylah.j on 2022/05/07.
//

import Foundation

protocol RacingGameJudge {
    func winner(of racingGameResult: [RacingRound]) -> [RacingCar]?
}
    
struct NormalRacingGameJudge: RacingGameJudge {
    func winner(of racingGameResult: [RacingRound]) -> [RacingCar]? {
        guard let lastRound = racingGameResult.last else {
            return nil
        }
        return lastRound.winners()
    }
}

