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
    
    func play() -> [[Int]] {
        var gameResult = [[Int]]()
        var matchInfo = [Int](repeating: 0, count: gameInfo.racingGameCarNumber())
        
        for _ in 0..<gameInfo.racingGameMatchNumber() {
            let match = match(matchInfo: matchInfo,
                              carNumber: gameInfo.racingGameCarNumber())
            matchInfo = match
            gameResult.append(matchInfo)
        }
        
        return gameResult
    }
    
    private func match(matchInfo: [Int], carNumber: Int) -> [Int] {
        var updatedMatchInfo = matchInfo
        
        for car in 0..<carNumber {
            updatedMatchInfo[car] += forwardNumberMaker.forward()
        }
        
        return updatedMatchInfo
    }
}
