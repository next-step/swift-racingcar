//
//  RacingCar.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/08.
//

import Foundation

struct RacingCar {
    private(set) var position: Position
    
    mutating func move() {
        position.move()
    }
}
