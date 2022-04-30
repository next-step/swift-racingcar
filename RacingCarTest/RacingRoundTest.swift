//
//  RoundTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/30.
//

import XCTest

class RacingRoundTest: XCTestCase {

    func test_RacingRound를_start하면_해당round가_종료되었을때_자동차의_위치정보를_담고있는_RacingRound를_반환한다() {
        // give
        let firstCar = RacingCar(id: 1, engine: MovingEngine())
        let secondCar = RacingCar(id: 2, engine: UnmovingEngine())
        
        let racingRound = NormalRacingRound(racingCars:[firstCar, secondCar])
        
        // when
        let racingResult = racingRound.start()
        
        // then
        let firstCarLocation = racingResult[firstCar]
        let secondCarLocaiton = racingResult[secondCar]
        
        XCTAssertEqual(firstCarLocation, firstCar.location)
        XCTAssertEqual(secondCarLocaiton, secondCar.location)
    }
}
