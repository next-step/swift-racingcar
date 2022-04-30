//
//  RoundTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/30.
//

import XCTest

class RacingRoundTest: XCTestCase {

    func test_RacingRound를_start하면_라운드결과_정보를_담는_RacingRound를_반환한다() {
        // give
        let firstCar = RacingCar(id: 1, engine: MovingEngine())
        let secondCar = RacingCar(id: 2, engine: UnmovingEngine())
        
        let racingRound = RacingRound(racingCars:[firstCar, secondCar])
        
        // when
        let racingResult = racingRound.start()
        
        // then
        let firstCarLocation = racingResult[firstCar]
        let secondCarLocaiton = racingResult[secondCar]
        
        XCTAssertEqual(firstCarLocation, firstCar.location)
        XCTAssertEqual(secondCarLocaiton, secondCar.location)
    }
}
