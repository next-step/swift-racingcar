//
//  RacingTrackTest.swift
//  RacingCarTest
//
//  Created by Ppop on 2021/11/15.
//

import XCTest

// TODO: - ReadLine 테스트는 어떻게 진행해야 할까??
class RacingTrackTest: XCTestCase {
    var racingTrack: RacingTrackProtocol!
    var racer: RacerPtorocol!
    var referee: RefereeProtocol!
    
    override func setUpWithError() throws {
        racer = Racer()
        referee = Referee()
        racingTrack = RacingTrack(referee: referee)
    }
    
    override func tearDownWithError() throws {
        racer = nil
        referee = nil
        racingTrack = nil
    }
    
    func test_SetupGame() {
        let exceptation = XCTestExpectation(description: "SetupGame Exceptation")
        try? racingTrack.setupGame { cars, trys in
            exceptation.fulfill()
        }
        
        wait(for: [exceptation], timeout: 1.0)
    }
    
    func test_SetupGame_WrongNumberOfCars() {
        do {
            try racingTrack.setupGame { cars, trys in
         
            }
        } catch {
            XCTAssertEqual(RacingTrack.SetupGameError.wrongNumberOfCars, error as! RacingTrack.SetupGameError)
        }
    }
    
    func test_SetupGame_WrongNumberOfTrys() {
        do {
            try racingTrack.setupGame { cars, trys in
         
            }
        } catch {
            XCTAssertEqual(RacingTrack.SetupGameError.wrongNumberOfTrys, error as! RacingTrack.SetupGameError)
        }
    }
}
