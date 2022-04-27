//
//  Racing.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/27.
//

import Foundation

struct Racing {
    static func play(gameInfo: RacingPlayable) -> [[Int]] {
        var gameResult = [[Int]]()
        var matchResult = [Int](repeating: 0, count: gameInfo.racingGameCarNumber())
        
        for _ in 0..<gameInfo.racingGameMatchNumber() {
            for car in 0..<gameInfo.racingGameCarNumber() {
                matchResult[car] += moveValue()
            }
            gameResult.append(matchResult)
        }
        
        return gameResult
    }
    
    static func moveValue() -> Int {
        let moveValue = Int.random(in: 0...9)
        return (moveValue > 4) ? 1 : 0
    }
}
