//
//  Car.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/27.
//

import Foundation

final class Car {
    
    // MARK: - Property
    private(set) var moveCount: Int = 0
    
    // MARK: - Method
    func generateRandomNumber() -> Int {
        return Int.random(in: 0 ... 9)
    }
    
    func move(randomNumber: Int) throws {
        if try Validator.checkValidation(number: randomNumber) >= 4 {
            moveCount += 1
        }
    }
}
