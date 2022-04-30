//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/30.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {
    func test_자동차가_달리면_달린_위치가_1증가한다() {
        // giveng
        let racingCar = RacingCar(id: 0, engine: MovingEngine())
        let previousLocation = racingCar.location

        // when
        racingCar.move()
        let currentLocation = racingCar.location
        
        
        // then
        XCTAssertEqual(previousLocation + 1, currentLocation)
    }
}
