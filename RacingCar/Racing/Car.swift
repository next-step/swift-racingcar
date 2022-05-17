//
//  Car.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/13.
//

import Foundation

enum CarError: Error {
    case generateCountIsLow
}

struct Car {
    var moveDistance: Int = 1
    
    mutating func moveFoward(fuel: Fuel) {
        guard fuel.liter >= 4 else { return }
        self.moveDistance += fuel.liter
    }
    
    static func generateCars(count: Int) throws -> [Car] {
        guard count > 0 else {
            throw CarError.generateCountIsLow
        }
        
        return Array(repeating: Car(), count: count)
    }
}
