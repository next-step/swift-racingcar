//
//  Car.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


final class Car {
    var randomGenerator: RandomGettable
    var movePoint: Int = 0
    
    init(randomGenerator: RandomGettable) {
        self.randomGenerator = randomGenerator
    }

    func move() {
        let conditionNumber = generateMoveConditionNumber()
        let movePoint = isMoveToNext(randomNumber: conditionNumber) ? 1 : 0
        self.movePoint += movePoint
    }
    
    private func generateMoveConditionNumber() -> Int {
        return randomGenerator.generateMoveConditionNumber()
    }

    private func isMoveToNext(randomNumber: Int) -> Bool {
        return randomNumber > 4
    }

  
    
}
