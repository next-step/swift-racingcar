//
//  Car.swift
//  RacingCar
//
//  Created by 조민호 on 2021/11/04.
//

import Foundation

final class Car {
    private(set) var position: String
    
    init(position: String = GameOption.defaultPosition) {
        self.position = position
    }
    
    func move(amount: Int) {
        guard canMove(amount: amount) else {
            return
        }
        
        position += GameOption.moveDistance
    }
    
    private func canMove(amount: Int) -> Bool {
        guard amount >= GameOption.minimumMovementDistance else {
            return false
        }
        
        return true
    }
}
