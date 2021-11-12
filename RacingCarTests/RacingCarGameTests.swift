//
//  RacingCarGameTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/11/12.
//

import XCTest

class RacingCarGameTests: XCTestCase {
    
    func test_tryMovingRacingCarsWithRandomNumbers_not_move() {
        let position = Position(value: 0, distanceUnit: 1)
        var racingCarGame =  makeRacingCarGame(
            position: position,
            randomNumberRange: (0...0),
            moveCheckerRange: (4...4)
        )
        
        racingCarGame.tryMovingRacingCarsWithRandomNumbers()
        
        XCTAssertEqual(racingCarGame.racingCarPositions, [position])
    }
    
    func test_tryMovingRacingCarsWithRandomNumbers_move() {
        let randomNumberRange = (0...0)
        var position = Position(value: 0, distanceUnit: 1)
        var racingCarGame =  makeRacingCarGame(
            position: position,
            randomNumberRange: randomNumberRange,
            moveCheckerRange: randomNumberRange
        )
        
        position.move()
        racingCarGame.tryMovingRacingCarsWithRandomNumbers()
        
        XCTAssertEqual(racingCarGame.racingCarPositions, [position])
    }

}

extension RacingCarGameTests {
    
    func makeRacingCarGame(
        position: Position,
        randomNumberRange: ClosedRange<Int>,
        moveCheckerRange: ClosedRange<Int>
    ) -> RacingCarGame {
        
        RacingCarGame(
            randomNumber: RandomNumber(range: randomNumberRange),
            racingCarDrivers: [RacingCarDriver(
                racingCar: RacingCar(position: position),
                moveChecker: MoveChecker(movableRange: moveCheckerRange)
            )]
        )
    }
}
