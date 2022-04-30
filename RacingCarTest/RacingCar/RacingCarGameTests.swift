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
        randomDigitNumberMaker = nil
    }
    
    func test_roundCount_whenRaceCountIsZero_equalToZero() throws {
        // given
        let carNames = ["naljin"]
        let raceCount = 0
        sut = RacingCarGame(carNames: carNames,
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
        let carNames = ["naljin"]
        let raceCount = 1
        sut = RacingCarGame(carNames: carNames,
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
        let carNames = ["naljin"]
        let raceCount = 0
        sut = RacingCarGame(carNames: carNames,
                            raceCount: raceCount,
                            randomDigitNumberMaker: randomDigitNumberMaker)

        // when
        sut.start()

        // then
        let firstRoundCarCount = sut.roundHistory.rounds.first?.cars.count
        XCTAssertNil(firstRoundCarCount)
    }
    
    func test_carCountPerRound_whenEmptyCarNames_equalToZero() throws {
        // given
        let carNames: [String] = []
        let raceCount = 1
        sut = RacingCarGame(carNames: carNames,
                            raceCount: raceCount,
                            randomDigitNumberMaker: randomDigitNumberMaker)

        // when
        sut.start()

        // then
        let firstRoundCarCount = sut.roundHistory.rounds.first?.cars.count
        let expectation = 0
        XCTAssertEqual(firstRoundCarCount, expectation)
    }
    

    func test_carCountPerRound_whenOneCarNames_equalToOne() throws {
        // given
        let carNames = ["naljin"]
        let raceCount = 1
        sut = RacingCarGame(carNames: carNames,
                            raceCount: raceCount,
                            randomDigitNumberMaker: randomDigitNumberMaker)

        // when
        sut.start()

        // then
        let firstRoundCarCount = sut.roundHistory.rounds.first?.cars.count
        let expectation = 1
        XCTAssertEqual(firstRoundCarCount, expectation)
    }

    func test_carPosition_afterARace_forwardOneStep() throws {
        // given
        let carNames = ["naljin"]
        let raceCount = 2
        sut = RacingCarGame(carNames: carNames,
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
