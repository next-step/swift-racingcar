//
//  Racing.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/27.
//

import Foundation

struct Racing {
    static func play(gameInfo: RacingPlayable) -> [[Int]] {
        return game(gameInfo: gameInfo)
    }
    
    private static func game(gameInfo: RacingPlayable) -> [[Int]] {
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
    
    private static func match(matchInfo: [Int], carNumber: Int) -> [Int] {
        var updatedMatchInfo = matchInfo
        
        for car in 0..<carNumber {
            updatedMatchInfo[car] += moveValue()
        }
        
        return updatedMatchInfo
    }
    
    private static func moveValue() -> Int {
        let moveValue = Int.random(in: 0...9)
        return (moveValue > 4) ? 1 : 0
    }
}
