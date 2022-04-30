//
//  RacingGame.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/30.
//

import XCTest

extension RacingGameResult: Equatable {
    static func == (lhs: RacingGameResult, rhs: RacingGameResult) -> Bool {
        return lhs.racingRoundResut == rhs.racingRoundResut
    }
}

class RacingGameTest: XCTestCase {

    func test_RacingGame을_시작하면_게임실행결과를_담는_RacingGameResult를_얻을_수_있다() {
        // given
        let firstCar = RacingCar(id: 0, engine: MovingEngine())
        let secondCar = RacingCar(id: 1, engine: UnmovingEngine())
        let thirdCar = RacingCar(id: 2, engine: UnmovingEngine())
        
        let racingCars = [firstCar, secondCar, thirdCar]
        let roundCount = 2
        
        let racingRound = RacingRound(racingCars: racingCars)
        let racingGame = RacingGame(racingCars: racingCars, roundCount: roundCount)
        
        let firstRoundResult = racingRound.start()
        let secondRoundResult = racingRound.start()
        let expectedRacingResult = RacingGameResult(racingRoundResut: [firstRoundResult, secondRoundResult])
        
        // when
        let racingGameResult = racingGame.start()
        
        // then
        
        XCTAssertEqual(racingGameResult, expectedRacingResult)
    }

}
