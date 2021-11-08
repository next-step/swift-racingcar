//
//  PositionTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/11/08.
//

import XCTest

class PositionTests: XCTestCase {
    
    func test_movePosition() {
        let distance = 3
        var position = Position(position: 0, distanceUnit: distance)
        position.move()
        
        XCTAssertEqual(position, Position(position: distance, distanceUnit: distance))
    }
    
}
