//
//  RacingCarTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/11/08.
//

import XCTest

class RacingCarTests: XCTestCase {
    func test_moveRacingCar() {
        var position = Position(position: 0, distanceUnit: 3)
        var racingCar = RacingCar(position: position)
        
        racingCar.move()
        position.move()
        
        XCTAssertEqual(racingCar.position, position)
    }
    
    func test_movePosition() {
        let distance = 3
        var position = Position(position: 0, distanceUnit: distance)
        position.move()
        
        XCTAssertEqual(position, Position(position: distance, distanceUnit: distance))
    }
    
    func test_MoveChecker_isMovable_true() {
        let moveChecker = MoveChecker(movableRange: Range<Int>(4...9))
        
        XCTAssertTrue(moveChecker.isMovable(4))
    }
    
    func test_MoveChecker_isMovable_false() {
        let moveChecker = MoveChecker(movableRange: Range<Int>(4...9))
        
        XCTAssertFalse(moveChecker.isMovable(0))
    }
    
    func test_RacingCarMover_move() {
        var position = Position(position: 0, distanceUnit: 1)
        let racingCar = RacingCar(position: position)
        let moveChecker = MoveChecker(movableRange: Range<Int>(4...9))
        var racingCarMover = RacingCarMover(
            racingCar: racingCar,
            moveChecker: moveChecker
        )
        
        racingCarMover.moveIfPossible(with: 4)
        position.move()
        
        XCTAssertEqual(racingCarMover.racingCarPosition, position)
    }
    
    func test_RacingCarMover_not_move() {
        let position = Position(position: 0, distanceUnit: 1)
        let racingCar = RacingCar(position: position)
        let moveChecker = MoveChecker(movableRange: Range<Int>(4...9))
        var racingCarMover = RacingCarMover(
            racingCar: racingCar,
            moveChecker: moveChecker
        )
        
        racingCarMover.moveIfPossible(with: 1)
        
        XCTAssertEqual(racingCarMover.racingCarPosition, position)
    }
}
