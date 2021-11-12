//
//  RacingCarDriverTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/11/08.
//

import XCTest

class RacingCarDriverTests: XCTestCase {
    var position = Position(value: 0, distanceUnit: 1)
    var racingCarDriver = RacingCarDriver(
        racingCar: RacingCar(position: Position(value: 0, distanceUnit: 1)),
        moveChecker: MoveChecker(movableRange: (4...9))
    )
    
    override func tearDownWithError() throws {
        position = Position(value: 0, distanceUnit: 1)
        racingCarDriver = RacingCarDriver(
            racingCar: RacingCar(position: position),
            moveChecker: MoveChecker(movableRange: (4...9))
        )
    }

    func test_RacingCarMover_move() {
        racingCarDriver.tryMoving(with: 4)
        position.move()
        
        XCTAssertEqual(racingCarDriver.racingCarPosition, position)
    }
    
    func test_RacingCarMover_not_move() {
        racingCarDriver.tryMoving(with: 1)
        
        XCTAssertEqual(racingCarDriver.racingCarPosition, position)
    }

}
