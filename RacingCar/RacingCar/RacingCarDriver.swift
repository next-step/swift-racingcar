//
//  RacingCarDriver.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/10.
//

import Foundation

struct RacingCarDriver {
    private let moveChecker: MoveChecker
    private var racingCar: RacingCar
    
    init(racingCar: RacingCar, moveChecker: MoveChecker) {
        self.racingCar = racingCar
        self.moveChecker = moveChecker
    }
    
    var racingCarPosition: Position {
        racingCar.position
    }
    
    mutating func tryMoving(with number: Int) {
        if moveChecker.isMovable(number) {
            racingCar.move()
        }
    }
}
