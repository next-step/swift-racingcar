//
//  RacingCar.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

class RacingCar: Equatable {
    static func == (lhs: RacingCar, rhs: RacingCar) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let engine: Engine
    private var _location = 0
    
    var location: Int {
        return self._location
    }
    
    init(id: Int, engine: Engine) {
        self.id = id
        self.engine = engine
    }
    
    func move() {
        if engine.canGo() {
            self._location += 1
        }
    }
}
