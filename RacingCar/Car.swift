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
        let conditionNumber = randomGenerator.random()
        let movePoint = randomGenerator.isMoveToNext(randomNumber: conditionNumber)
        self.movePoint += movePoint ? 1 : 0
    }
}


