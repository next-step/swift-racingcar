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
    
    func test_raceRecordCount_equalReceCount() throws {
        // given
        
        // when
        sut.start()
        
        // then
        let raceRecordCount = sut.raceRecords.count
        XCTAssertEqual(raceRecordCount, raceCount)
    }
    
    func test_carCountPerRace_equalCarCount() throws {
        // given
        
        // when
        sut.start()
        
        // then
        let firstRecordCarCount = sut.raceRecords.first?.count
        XCTAssertEqual(firstRecordCarCount, carCount)
    }
    
    func test_carPosition_afterARace_forwardOneStep() throws {
        // given
        
        // when
        sut.start()

        // then
        let firstRace = sut.raceRecords[0]
        let positionInFirstRace = try XCTUnwrap(firstRace.first).position

        let secondRace = sut.raceRecords[1]
        let positionInSecondRace = try XCTUnwrap(secondRace.first).position

        XCTAssertEqual(positionInFirstRace + 1, positionInSecondRace)
    }
}
