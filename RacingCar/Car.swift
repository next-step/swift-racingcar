//
//  Car.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


final class Car {
    var randomGenerator: RandomGettable
    var minimumCondition: Int = 4
    var movePoint: Int = 0
    
    init(randomGenerator: RandomGettable) {
        self.randomGenerator = randomGenerator
    }

    func move() {
        let conditionNumber = randomGenerator.random()
        let isMoveCondidion = isMoveToNext(randomNumber: conditionNumber)
        self.movePoint += isMoveCondidion ? 1 : 0
    }
    
    func isMoveToNext(randomNumber: Int) -> Bool {
        return randomNumber > minimumCondition
    }
}


