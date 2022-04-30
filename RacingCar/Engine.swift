//
//  Engine.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

protocol Engine {
    func canGo() -> Bool
}

struct RacingCarEngine: Engine {
    private static let movingStandard: Int = 4
    let randomNumberGenerator: RandomNumberGenerator
    
    init(randomNumberGenerator: RandomNumberGenerator) {
        self.randomNumberGenerator = randomNumberGenerator
    }
    
    func canGo() -> Bool {
        let randomNumber = randomNumberGenerator.generate()
        
        return randomNumber >= RacingCarEngine.movingStandard
    }
}
