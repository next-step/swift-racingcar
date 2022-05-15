//
//  Fuel.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/13.
//

import Foundation

struct Fuel {
    private(set) var liter: Int
    
    init() {
        let energy = Int.random(in: 0...9)
        self.liter = energy
    }
    
    mutating func setLiter(_ liter: Int) {
        self.liter = liter
    }
}
