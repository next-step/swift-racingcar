//
//  GameOption.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/29.
//

import Foundation

class GameOption {
    static func generateRandomNumber() -> Int {
        return Int(arc4random_uniform(10))
    }
    
    static func canGoFoward(_ n: Int) -> Bool {
        return n >= 4
    }
}
