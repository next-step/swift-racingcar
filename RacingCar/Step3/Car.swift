//
//  Car.swift
//  RacingCar
//
//  Created by brian은석 on 2022/04/30.
//

import Foundation

struct Car {
    private(set) var distance: Int = 1
    
    mutating func move() {
        self.distance += 1
    }
}
