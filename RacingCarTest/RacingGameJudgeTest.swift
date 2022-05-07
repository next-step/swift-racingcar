//
//  RacingGameJudgeTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/05/07.
//

import XCTest
@testable import RacingCar

class RacingGameJudgeTest: XCTestCase {
    func test_winner_RacingRound배열을_입력받아서_우승자_자동차_배열을_반환한다(){
        // given
        var firstRacingCar = try! RacingCar(id: 0, name: "12345", engine: MovingEngine())
        var secondRacingCar = try! RacingCar(id: 1, name: "23456", engine: UnmovingEngine())
        
        firstRacingCar.move()
        secondRacingCar.move()
        
        let roundResult = try! NormalRacingRound(racingCars: [firstRacingCar, secondRacingCar]).start()
        let racingGameResult = [roundResult]
        
        let racingGameJudge: RacingGameJudge = NormalRacingGameJudge()
        
        // when
        let winner = try! racingGameJudge.winner(of: racingGameResult)
        
        // then
        XCTAssertEqual(winner, [firstRacingCar])
    }
    
    func test_winner_RacingGameResult가_존재하지않으면_에러를_일으킨다() {
        // given
        let racingGameJudge = NormalRacingGameJudge()
        
        // when
        // then
        XCTAssertThrowsError(try racingGameJudge.winner(of: []))
    }
}
