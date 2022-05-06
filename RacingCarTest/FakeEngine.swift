//
//  FakeEngine.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

struct MovingEngine: Engine {
    func canGo() -> Bool {
        return true
    }
}

struct UnmovingEngine: Engine {
    func canGo() -> Bool {
        return false
    }
}
