//
//  RacingCar.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

struct RacingCar {
    let engine: Engine
    private var _location = 0
    var location: Int {
        return self._location
    }
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    mutating func move() {
        if engine.canGo() {
            self._location += 1
        }
    }
}
