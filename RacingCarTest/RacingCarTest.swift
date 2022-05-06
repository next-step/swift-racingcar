//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/30.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {
    func test_자동차가_움직이면_자동차의_위치가_1증가한다() {
        // given
        let racingCar = RacingCar(id: 0, engine: MovingEngine())
        let previousLocation = racingCar.location

        // when
        racingCar.move()
        
        // then
        XCTAssertEqual(racingCar.location, previousLocation + 1)
    }
    
    func test_자동차가_움직이지_않으면_자동차의_위치는_변경되지_않는다() {
        // given
        let racingCar = RacingCar(id: 0, engine: UnmovingEngine())
        let previousLocation = racingCar.location

        // when
        racingCar.move()
        
        // then
        XCTAssertEqual(racingCar.location, previousLocation)
    }
}
