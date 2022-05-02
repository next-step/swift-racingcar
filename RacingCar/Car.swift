//
//  Car.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/27.
//

import Foundation

final class Car {
    
    // MARK: - Property
    let name: String
    private(set) var moveCount: Int = 0
    private let canMoveMinNumber = 4
    private let move = 1
    
    // MARK: Initializer
    init(name: String) {
        self.name = name
    }
    
    // MARK: - Method
    func generateRandomNumber() -> Int {
        return Int.random(in: 0 ... 9)
    }
    
    func move(randomNumber: Int) throws {
        if try Validator.checkValidation(number: randomNumber) >= canMoveMinNumber {
            moveCount += 1
        }
    }
}
