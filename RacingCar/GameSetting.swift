//
//  GameSetting.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


struct GameSetting: Equatable {
   
    let gameCount: Int
    let carNames: [String]
    let randomGenerator: RandomGettable
    
    init(gameCount: Int = 0, carNames: [String] = [], randomGenerator: RandomGettable) {
        self.gameCount = gameCount
        self.carNames = carNames
        self.randomGenerator = randomGenerator
    }
    
    static func == (lhs: GameSetting, rhs: GameSetting) -> Bool {
        return lhs.gameCount == rhs.gameCount
                && lhs.carNames == rhs.carNames
                && lhs.randomGenerator.randomRange == rhs.randomGenerator.randomRange
    }

}
