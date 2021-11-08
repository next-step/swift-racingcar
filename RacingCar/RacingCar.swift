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

struct RacingCarGame {
    let randomRange: Range<Int>
    private var racingCarMovers: [RacingCarMover]
    
    init(randomRange: Range<Int>, racingCarMovers: [RacingCarMover]) {
        self.randomRange = randomRange
        self.racingCarMovers = racingCarMovers
    }
    
    var racingCarPositions: [Position] {
        racingCarMovers.map { $0.racingCarPosition }
    }
    
    mutating func tryMovingRacingCarsWithRandomNumbers() {
        racingCarMovers.indices.forEach {
            racingCarMovers[$0].tryMoving(with: Int.random(in: randomRange))
        }
    }
}

struct InputView {
    private(set) var input: String = ""
    
    mutating func readInput() {
        input = readLine() ?? ""
    }
}

struct LabelView {
    let title: String
    let terminator: String
    
    init(title: String, terminator: String = "\n") {
        self.title = title
        self.terminator = terminator
    }
    
    func printTitle() {
        print(title, terminator: terminator)
    }
}


