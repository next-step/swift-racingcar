//
//  Racing.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/27.
//

import Foundation

struct Racing {
    private let forwardNumberMaker: RacingForwardNumberMakable
    private let gameInfo: RacingPlayable
    
    init(gameInfo: RacingPlayable, forwardNumberMaker: RacingForwardNumberMakable) {
        self.forwardNumberMaker = forwardNumberMaker
        self.gameInfo = gameInfo
    }
    
    func play() -> [[AbleToRace]] {
        var gameResult = [[AbleToRace]]()
        var matchInfo: [AbleToRace] = gameInfo.racingGamePlayers().map { RacingPlayer(name: $0) }
        let playerCount: Int = gameInfo.racingGamePlayers().count
        
        for _ in 0..<gameInfo.racingGameRound() {
            matchInfo = match(before: matchInfo, playerCount: playerCount)
            gameResult.append(matchInfo)
        }
        
        return gameResult
    }
    
    private func match(before matchInfo: [AbleToRace], playerCount: Int) -> [AbleToRace] {
        var updatedMatchInfo: [AbleToRace] = matchInfo
        
        for player in 0..<playerCount {
            updatedMatchInfo[player].move(foward: forwardNumberMaker.forward())
        }
        
        return updatedMatchInfo
    }
}
