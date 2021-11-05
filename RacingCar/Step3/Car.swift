//
//  Car.swift
//  RacingCar
//
//  Created by 조민호 on 2021/11/04.
//

import Foundation

enum GameOption {
    static let defaultPosition: Int = 0
    static let movementRange: ClosedRange = 4...9
    static let randomNumberRange: ClosedRange = 0...9
}

struct Car {
    private(set) var position: Int
    
    mutating func move(amount: Int) {
        let movingDistance: Int = amount
        if GameOption.movementRange.contains(movingDistance) {
            position += movingDistance
        }
    }
}
