//
//  Car.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

final class RacingCar: GameObjectable {
    
    private var engine: Enginable
    private(set) var position: Positionable
    
    init(engine: Enginable, position: Positionable) {
        self.engine = engine
        self.position = position
    }
    
    func move() {
        guard engine.isPossibleToMove() else { return }
        
        position.move()
    }
}
