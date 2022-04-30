//
//  RecordHistoryTests.swift
//  RacingCarTest
//
//  Created by 강수진 on 2022/04/30.
//

import XCTest

class RoundHistoryTests: XCTestCase {
    
    var sut: RoundHistory!
    
    override func setUpWithError() throws {
        sut = RoundHistory()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_roundCount_whenAppendOneRound_equalToOne() throws {
        // given
        let car: Car = Car(name: "sujin", position: 0)
        let round: Round = Round(cars: [car])
        
        // when
        sut.append(round)
        
        // then
        let result = sut.rounds.count
        let expectation = 1
        XCTAssertEqual(result, expectation)
    }
}
