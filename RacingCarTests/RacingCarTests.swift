//
//  RacingCarTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/11/08.
//

import XCTest

class RacingCarTests: XCTestCase {
    
    func test_move() {
        var position = Position(value: 0, distanceUnit: 3)
        var racingCar = RacingCar(position: position)
        
        racingCar.move()
        position.move()
        
        XCTAssertEqual(racingCar.position, position)
    }
    
}
