//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 카카오VX on 2022/04/27.
//

import XCTest

class RacingCarTest: XCTestCase {
    private let gameInfo = GameInfo(players: ["mansa", "kim"], round: 3)
    private let forwardMaker = RacingForwardMaker()
    private lazy var racing = Racing(gameInfo: gameInfo, forwardNumberMaker: forwardMaker)
    
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

    func testRacingGameInfo() {
        let gameInfo = GameInfo(players: ["mansa", "kim"], round: 3)

        XCTAssertEqual(gameInfo.racingGamePlayers(), ["mansa", "kim"])
        XCTAssertEqual(gameInfo.racingGameRound(), 3)
    }
    
    func testRacingPlayer() {
        var player = RacingPlayer(name: "mansa", moveCount: 0)
        
        XCTAssertEqual(player.racerName(), "mansa")
        XCTAssertEqual(player.moveCountByRacer(), 0)
        
        player.move(forward: 1)
        
        XCTAssertEqual(player.moveCountByRacer(), 1)
    }
    
    func testRacing() {
        let racing = Racing(gameInfo: gameInfo, forwardNumberMaker: forwardMaker)
        
        XCTAssertEqual(racing.play().first?[0].racerName(), "mansa")
        XCTAssertEqual(racing.play().first?[1].racerName(), "kim")
        XCTAssertEqual(racing.play().first?[0].moveCountByRacer(), 1)
        XCTAssertEqual(racing.play().first?[1].moveCountByRacer(), 1)
    }
    
    func testRacingWinnderGroup() {
        let racingInfo = RacingInfo(racing: racing.play())
        let winnderGroup = racingInfo.winnerGroup()
        
        XCTAssertEqual(winnderGroup.first?.racerName(), "mansa")
        XCTAssertEqual(winnderGroup.last?.racerName(), "kim")
    }
    
    func testRacingInfo() {
        let racingInfo = RacingInfo(racing: racing.play()).racingInfo()
        
        XCTAssertEqual(racingInfo.first?[0].racerName(), "mansa")
        XCTAssertEqual(racingInfo.first?[1].racerName(), "kim")
        XCTAssertEqual(racingInfo.first?[0].moveCountByRacer(), 1)
        XCTAssertEqual(racingInfo.first?[1].moveCountByRacer(), 1)
    }
}
