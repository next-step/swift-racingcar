//
//  RacingCarMoverTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/11/08.
//

import XCTest

class RacingCarMoverTests: XCTestCase {
    var position = Position(position: 0, distanceUnit: 1)
    var racingCarMover = RacingCarDriver(
        racingCar: RacingCar(position: Position(position: 0, distanceUnit: 1)),
        moveChecker: MoveChecker(movableRange: (4...9))
    )
    
    override func tearDownWithError() throws {
        position = Position(position: 0, distanceUnit: 1)
        racingCarMover = RacingCarDriver(
            racingCar: RacingCar(position: position),
            moveChecker: MoveChecker(movableRange: (4...9))
        )
    }

    func test_RacingCarMover_move() {
        racingCarMover.tryMoving(with: 4)
        position.move()
        
        XCTAssertEqual(racingCarMover.racingCarPosition, position)
    }
    
    func test_RacingCarMover_not_move() {
        racingCarMover.tryMoving(with: 1)
        
        XCTAssertEqual(racingCarMover.racingCarPosition, position)
    }

}
