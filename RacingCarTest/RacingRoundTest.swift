//
//  RoundTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/30.
//

import XCTest
@testable import RacingCar

class RacingRoundTest: XCTestCase {

    func test_RacingRound를_start하면_해당round가_종료되었을때_자동차의_위치정보를_담고있는_RacingRound를_반환한다() {
        // give
        let firstCar = RacingCar(id: 1, engine: MovingEngine())
        let secondCar = RacingCar(id: 2, engine: UnmovingEngine())
        
        let racingRound = try! NormalRacingRound(racingCars:[firstCar, secondCar])
        
        // when
        let racingResult: RacingRound = racingRound.start()
        
        // the
        XCTAssertEqual(firstCar.location + 1, racingResult.racingCars[0].location)
        XCTAssertEqual(secondCar.location, racingResult.racingCars[1].location)
    }
    
    func test_init_RacingRound는_1개이상의_RacingCar만_가질수있다() {
        // given
        let racingCars: [RacingCar] = []
        
        // when
        XCTAssertThrowsError(try NormalRacingRound(racingCars: racingCars))g
    }
}
