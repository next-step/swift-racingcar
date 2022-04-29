//
//  GameSetting.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


struct GameSetting: Equatable {
   
    
    let gameCount: Int
    let carCount: Int
    let randomGenerator: RandomGettable
    
    init(gameCount: Int = 0, carCount: Int = 0, randomGenerator: RandomGettable) {
        self.gameCount = gameCount
        self.carCount = carCount
        self.randomGenerator = randomGenerator
    }
    
    static func == (lhs: GameSetting, rhs: GameSetting) -> Bool {
        return lhs.gameCount == rhs.gameCount
                && lhs.carCount == rhs.carCount
        && lhs.randomGenerator.randomRange == rhs.randomGenerator.randomRange
    }
    

}
