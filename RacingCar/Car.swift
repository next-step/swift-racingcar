//
//  Car.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


final class Car {
    
   private enum Constant {
        static let basePoint: Int = 0
        static let minumCondition: Int = 4
    }
    
    //MARK: - PROPERTIES
    var randomGenerator: RandomGettable
    var minimumCondition: Int = Constant.minumCondition
    var movePoint: Int
    private(set) var name: String
    
    init(name: String,
         randomGenerator: RandomGettable,
         movePoint: Int = Constant.basePoint
    ) {
        self.movePoint = movePoint
        self.name = name
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


