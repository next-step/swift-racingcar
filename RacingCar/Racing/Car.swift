//
//  Car.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/13.
//

import Foundation

enum CarError: Error {
    case generateCountIsLow
    case generateCarNameIsEmpty
}

struct Car {
    var name: String
    var moveDistance: Int = 1
    
    mutating func moveFoward(fuel: Fuel) {
        guard fuel.liter >= 4 else { return }
        self.moveDistance += fuel.liter
    }
    
    static func generateCars(with names: [String]) -> [Car] {
        return names.map { Car(name: $0) }
    }
}
