//
//  Position.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/10.
//

import Foundation

struct Position: Equatable {
    private(set) var position: Int
    let distanceUnit: Int
    
    mutating func move() {
        position += distanceUnit
    }
}
