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
    
    @discardableResult
    func move(randomNumber: Int) throws -> Bool {
        guard (0 ... 9).contains(randomNumber) else {
            throw RacingCarStep3Error.invalidNumber
        }
        if randomNumber >= 4 {
            moveCount += 1
            return true
        }
        return false
    }
}
