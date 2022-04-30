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

    func test_RacingGame을_시작하면_각_라운드의_실행결과를_담고있는_RacingGameResult를_얻을_수_있다() {
        // given
        let firstCar = RacingCar(id: 0, engine: MovingEngine())
        let secondCar = RacingCar(id: 1, engine: UnmovingEngine())
        let thirdCar = RacingCar(id: 2, engine: UnmovingEngine())
        
        let racingGame = RacingGame(racingCars: [firstCar, secondCar, thirdCar], roundCount: 2)
        
        // when
        let racingGameResult = racingGame.start()
        
        // then
        let firstRoundResult = RacingRoundResult(states: [.init(id: 0, location: 1), .init(id: 1, location: 0), .init(id: 2, location: 0)])
        let secondRoundResult = RacingRoundResult(states: [.init(id: 0, location: 2), .init(id: 1, location: 0), .init(id: 2, location: 0)])
        
        XCTAssert(racingGameResult.racingRoundResut[0] == firstRoundResult)
        XCTAssert(racingGameResult.racingRoundResut[1] == secondRoundResult)
    }
}
