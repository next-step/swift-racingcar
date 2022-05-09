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
        let firstCar = try! RacingCar(id: 1, name: "", engine: MovingEngine())
        let secondCar = try! RacingCar(id: 2, name: "", engine: UnmovingEngine())
        
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
        XCTAssertThrowsError(try NormalRacingRound(racingCars: racingCars))
    }
    
    func test_winners_각_라운드의_우승자는_location프로퍼티가_가장큰_자동차들이다() {
        // given
        let firstCar = try! RacingCar(id: 0, name: "12345", engine: MovingEngine())
        let secondCar = try! RacingCar(id: 1, name: "23456", engine: UnmovingEngine())
        let thirdCar = try! RacingCar(id: 2, name: "34567", engine: MovingEngine())
        
        let racingRound = try! NormalRacingRound(racingCars: [firstCar, secondCar, thirdCar])
        
        let racingResult = racingRound.start()
        
        // when
        let winners = racingResult.winners()
        
        // then
        XCTAssertEqual(winners, [firstCar, thirdCar])
    }
}
