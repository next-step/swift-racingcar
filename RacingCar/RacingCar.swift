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

class RacingCar {
    static func == (lhs: RacingCar, rhs: RacingCar) -> Bool {
        return lhs.id == rhs.id
    }
    
    struct State: Equatable {
        let id: Int
        let location: Int
    }
    
    private let id: Int
    private let engine: Engine
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
    
    func state() -> State {
        return .init(id: id, location: location)
    }
}
