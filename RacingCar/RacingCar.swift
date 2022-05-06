//
//  RacingCar.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

struct RacingCarFactory {
    static func create(id: Int) -> RacingCar {
        let range = 0..<9
        let randomNumberGenerator = RandomNumberGenerator(range: range)
        let engine = RacingCarEngine(randomNumberGenerator: randomNumberGenerator)
        return RacingCar(id: id, engine: engine)
    }
}

class RacingCar: Equatable, NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = RacingCar(id: self.id, engine: self.engine)
        copy._location = self._location 
        return copy
    }
    
    static func == (lhs: RacingCar, rhs: RacingCar) -> Bool {
        return lhs.id == rhs.id
        && lhs.location == rhs.location
    }
    
    let id: Int
    let engine: Engine
    private var _location = 0
    var location: Int { return _location }
    
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
