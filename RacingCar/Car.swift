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
    private let oneTimeMoveCount = 1
    
    // MARK: Initializer
    init(name: String) {
        self.name = name
    }
    
    // MARK: - Method
    
    func move(randomNumber: Int) throws {
        guard Validator.checkValidation(number: randomNumber) else {
            throw RacingCarError.invalidNumber
        }
        if randomNumber >= canMoveMinNumber {
            moveCount += oneTimeMoveCount
        }
    }
}
