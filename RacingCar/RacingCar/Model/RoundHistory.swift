//
//  RoundHistory.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/30.
//

import Foundation

final class RoundHistory {
    
    private(set) var rounds: [Round] = []
    var winningCars: [Car] {
        guard let finalRound = rounds.last else {
            return []
        }
        
        let maxPositionInFinalRound = finalRound
            .cars
            .map { car in
                car.position
            }
            .max()
        
        let winningCars = finalRound
            .cars
            .filter { car in
                car.position == maxPositionInFinalRound
            }
        return winningCars
    }
    
    func append(_ round: Round) {
        rounds.append(round)
    }
}
