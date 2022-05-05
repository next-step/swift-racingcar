//
//  RacingGame.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/30.
//

import XCTest

extension RacingGameResult: Equatable {
    static func == (lhs: RacingGameResult, rhs: RacingGameResult) -> Bool {
        return lhs.racingRoundResult == rhs.racingRoundResult
    }
}

class RacingGameTest: XCTestCase {

    func test_RacingGame을_시작하면_각_라운드의_실행결과를_담고있는_RacingRound_배열을_얻을_수_있다() {
        // given
        let firstCar = RacingCar(id: 0, engine: MovingEngine())
        let secondCar = RacingCar(id: 1, engine: UnmovingEngine())
        let thirdCar = RacingCar(id: 2, engine: UnmovingEngine())
        
        var racingGame = RacingGame(racingCars: [firstCar, secondCar, thirdCar], roundCount: 2)
        
        // when
        let racingGameResult = racingGame.start() as! [NormalRacingRound]
        
        // then
        firstCar.move()
        secondCar.move()
        thirdCar.move()
        let firstRoundResult = NormalRacingRound(racingCars: [firstCar, secondCar, thirdCar].copy())
        
        firstCar.move()
        secondCar.move()
        thirdCar.move()
        let secondRoundResult = NormalRacingRound(racingCars: [firstCar, secondCar, thirdCar].copy())
        
        XCTAssert(racingGameResult == [firstRoundResult, secondRoundResult])
    }
}
