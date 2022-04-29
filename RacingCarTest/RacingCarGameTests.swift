//
//  RacingCarGameTests.swift
//  RacingCarTest
//
//  Created by 강수진 on 2022/04/28.
//

import XCTest

class RacingCarGameTests: XCTestCase {

    var sut: RacingCarGame!
    var carCount: Int!
    var raceCount: Int!
    
    override func setUpWithError() throws {
        carCount = 4
        raceCount = 2
        
        let minimumDigitToCarGoForward = 4
        let randomDigitNumberMaker = RandomDigitNumberMakerStub(desiredDigit: minimumDigitToCarGoForward)
        sut = RacingCarGame(carCount: carCount,
                            raceCount: raceCount,
                            randomDigitNumberMaker: randomDigitNumberMaker)
    }

    override func tearDownWithError() throws {
        sut = nil
        carCount = nil
        raceCount = nil
    }
    
    func test_roundCount_equalReceCount() throws {
        // given
        
        // when
        sut.start()
        
        // then
        let roundCount = sut.roundHistory.rounds.count
        XCTAssertEqual(roundCount, raceCount)
    }
    
    func test_carCountPerRound_equalCarCount() throws {
        // given
        
        // when
        sut.start()
        
        // then
        let firstRoundCarCount = sut.roundHistory.rounds.first?.cars.count
        XCTAssertEqual(firstRoundCarCount, carCount)
    }
    
    func test_carPosition_afterARace_forwardOneStep() throws {
        // given
        
        // when
        sut.start()

        // then
        let firstRound = sut.roundHistory.rounds[0]
        let positionInFirstRound = try XCTUnwrap(firstRound.cars.first).position
        
        let secondRound = sut.roundHistory.rounds[1]
        let positionInSecondRound = try XCTUnwrap(secondRound.cars.first).position
        
        XCTAssertEqual(positionInFirstRound + 1, positionInSecondRound)
    }
}
