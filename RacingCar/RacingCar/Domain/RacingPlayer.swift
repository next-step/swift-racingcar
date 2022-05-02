//
//  RacingPlayer.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/29.
//

import Foundation

protocol AbleToRace {
    func racerName() -> String
    func moveCountByRacer() -> Int
    mutating func move(forward: Int)
}

struct RacingPlayer: Equatable, AbleToRace {
    private let name: String
    private var moveCount: Int
    
    init(name: String, moveCount: Int = 0) {
        self.name = name
        self.moveCount = moveCount
    }
    
    mutating func move(forward: Int) {
        moveCount += forward
    }
    
    func racerName() -> String {
        name
    }
    
    func moveCountByRacer() -> Int {
        moveCount
    }
}
