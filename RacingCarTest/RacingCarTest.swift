//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 카카오VX on 2022/04/27.
//

import XCTest

class RacingCarTest: XCTestCase {
    func testRacingInfoResult() {
        let racingInfo = RacingInfo(racing: [[1,1,0], [2,1,1], [3,2,1]])
        let racingResult = racingInfo.result()
        
        XCTAssertEqual(racingResult, [[1,1,0], [2,1,1], [3,2,1]])
    }
    
    func testGameInfo() {
        let gameInfo = GameInfo(carNumber: 3, matchNumber: 4)
        let carNumber = gameInfo.racingGameCarNumber()
        let roundNumber = gameInfo.racingGameMatchNumber()
        
        XCTAssertEqual(carNumber, 3)
        XCTAssertEqual(roundNumber, 4)
    }
    
    func testMakeRacingForwardLine() {
        let racingForwardLine = RacingForwardLineMaker.convertNumberToLine(move: 3)
        
        XCTAssertEqual(racingForwardLine, "---")
    }
    
    func testRacingRandomForward() {
        let randomNumber = RacingForwardRandomNumberMaker().forward()
        XCTAssertTrue(randomNumber >= 0 && randomNumber <= 1)
    }
    
    func testRacingForward() {
        let forward = RacingForwardMaker().forward()
        XCTAssertTrue(forward == 1)
    }
    
    func testRacingPlay() {
        let gameInfo = GameInfo(carNumber: 3, matchNumber: 4)
        let forwardMaker = RacingForwardMaker()
        let racing = Racing(gameInfo: gameInfo, forwardNumberMaker: forwardMaker)
        let racingResult = racing.play()
        
        XCTAssertEqual(racingResult, [[1, 1, 1], [2, 2, 2], [3, 3, 3], [4, 4, 4]])
    }
}
