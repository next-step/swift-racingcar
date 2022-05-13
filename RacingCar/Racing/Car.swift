//
//  Car.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/13.
//

import Foundation
struct Car {
    var moveDistance: Int = 1
    
    mutating func moveFoward(fuel: Fuel) {
        guard fuel.liter >= 4 else { return }
        self.moveDistance += fuel.liter
    }
    
    static func generateCars(count: Int) -> [Car] {
        return Array(repeating: Car(), count: count)
    }
}
