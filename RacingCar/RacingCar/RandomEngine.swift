//
//  RandomEngine.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

protocol Enginable {

    func isPossibleToMove() -> Bool
}

class RandomEngine: Enginable {
    
    private var randomGenerator: RandomNumberGenerator
    private let engineRule: EngineRuleProtocol
    
    init(randomGenerator: RandomNumberGenerator, engineRule: EngineRuleProtocol) {
        self.randomGenerator = randomGenerator
        self.engineRule = engineRule
    }
    
    func isPossibleToMove() -> Bool {
        return randomGenerator.next() >= engineRule.threshold
    }
}
