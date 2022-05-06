//
//  Car.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/07.
//

import Foundation

class Car {
    
    private(set) var position: Int
    
    init(position: Int) {
        self.position = position
    }
    
    func moveForword() {
        self.position += 1
    }
}
