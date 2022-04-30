//
//  RacingCarGameTests.swift
//  RacingCarTest
//
//  Created by 강수진 on 2022/04/28.
//

import XCTest

class RacingCarGameTests: XCTestCase {

    var randomDigitNumberMaker: RandomDigitNumberMakerStub!
    var sut: RacingCarGame!
    
    override func setUpWithError() throws {
        let minimumDigitToCarGoForward = 4
        randomDigitNumberMaker = RandomDigitNumberMakerStub(desiredDigit: minimumDigitToCarGoForward)
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_roundCount_whenRaceCountIsZero_equalToZero() throws {
        // given
        let carCount = 0
        let raceCount = 0
        sut = RacingCarGame(carCount: carCount,
                            raceCount: raceCount,
                            randomDigitNumberMaker: randomDigitNumberMaker)
        
        // when
        sut.start()
        
        // then
        let roundCount = sut.roundHistory.rounds.count
        XCTAssertEqual(roundCount, raceCount)
    }
    
    func test_roundCount_whenRaceCountIsOne_equalToOne() throws {
        // given
        let carCount = 0
        let raceCount = 1
        sut = RacingCarGame(carCount: carCount,
                            raceCount: raceCount,
                            randomDigitNumberMaker: randomDigitNumberMaker)
        // when
        sut.start()
        
        // then
        let roundCount = sut.roundHistory.rounds.count
        XCTAssertEqual(roundCount, raceCount)
    }
    
    func test_carCountPerRound_whenRoundIsZero_equalToNil() throws {
        // given
        let carCount = 1
        let raceCount = 0
        sut = RacingCarGame(carCount: carCount,
                            raceCount: raceCount,
                            randomDigitNumberMaker: randomDigitNumberMaker)

        // when
        sut.start()

        // then
        let firstRoundCarCount = sut.roundHistory.rounds.first?.cars.count
        XCTAssertNil(firstRoundCarCount)
    }
    
    func test_carCountPerRound_whenCarCountIsZero_equalToZero() throws {
        // given
        let carCount = 0
        let raceCount = 1
        sut = RacingCarGame(carCount: carCount,
                            raceCount: raceCount,
                            randomDigitNumberMaker: randomDigitNumberMaker)

        // when
        sut.start()

        // then
        let firstRoundCarCount = sut.roundHistory.rounds.first?.cars.count
        XCTAssertEqual(firstRoundCarCount, carCount)
    }
    

    func test_carCountPerRound_whenCarCountIsOne_equalToOne() throws {
        // given
        let carCount = 1
        let raceCount = 1
        sut = RacingCarGame(carCount: carCount,
                            raceCount: raceCount,
                            randomDigitNumberMaker: randomDigitNumberMaker)

        // when
        sut.start()

        // then
        let firstRoundCarCount = sut.roundHistory.rounds.first?.cars.count
        XCTAssertEqual(firstRoundCarCount, carCount)
    }

    func test_carPosition_afterARace_forwardOneStep() throws {
        // given
        let carCount = 1
        let raceCount = 2
        sut = RacingCarGame(carCount: carCount,
                            raceCount: raceCount,
                            randomDigitNumberMaker: randomDigitNumberMaker)

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
