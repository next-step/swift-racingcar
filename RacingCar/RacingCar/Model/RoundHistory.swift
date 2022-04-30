//
//  RoundHistory.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/30.
//

import Foundation

final class RoundHistory {
    
    private(set) var rounds: [Round] = []
    
    func append(_ round: Round) {
        rounds.append(round)
    }
}
