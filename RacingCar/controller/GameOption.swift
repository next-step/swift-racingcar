//
//  GameOption.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/29.
//

import Foundation

class GameOption {
    static func generateRandomNumber() -> Int {
        return Int.random(in: Constants.randomRange)
    }
    
    static func canGoFoward(_ n: Int) -> Bool {
        return n >= Constants.defaultCondition
    }
}
