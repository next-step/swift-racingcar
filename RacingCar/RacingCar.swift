//
//  RacingCar.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/08.
//

import Foundation

struct RacingCar {
    private(set) var position: Position
    
    mutating func move() {
        position.move()
    }
}

struct Position: Equatable {
    private(set) var position: Int
    let distanceUnit: Int
    
    mutating func move() {
        position += distanceUnit
    }
}

struct MoveChecker {
    let movableRange: Range<Int>
    
    func isMovable(_ number: Int) -> Bool {
        return movableRange.contains(number)
    }
}

struct RacingCarMover {
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
