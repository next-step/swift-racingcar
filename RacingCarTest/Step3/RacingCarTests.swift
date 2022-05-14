//
//  RacingCarTests.swift
//  RacingCarTests
//
//  Created by main on 2022/04/27.
//

import XCTest

class RacingCarTests: XCTestCase {
    
    func test_given자동차갯수0인경우_then결과Empty() throws {
        //given
        let race = Race(carCount: 0, roundCount: 5)
        
        //when
        do {
            try race.run()
        } catch {}
        
        //then
        let result = race.getCurrentStates()
        XCTAssertTrue(result.isEmpty)
    }
    
    func test_given라운드갯수0인경우_then모든자동차는제자리() throws {
        //given
        let race = Race(carCount: 5, roundCount: 0)
        
        //when
        do {
            try race.run()
        } catch {}
        
        //then
        let result = race.getCurrentStates()
        let runCarCount = result
            .filter { $0.position != 0 }
            .count
        XCTAssertEqual(runCarCount, 0)
    }
    
    func test_given라운드와자동차모두0인경우_then결과Empty() throws {
        //given
        let race = Race(carCount: 0, roundCount: 0)
        
        //when
        do {
            try race.run()
        } catch {}
        
        //then
        let result = race.getCurrentStates()
        XCTAssertTrue(result.isEmpty)
    }
    
    func test_given라운드와자동차모두0아닌경우_then자동차만큼결과값있음() throws {
        //given
        let roundCount = 5
        let race = Race(carCount: 5, roundCount: roundCount)
        
        //when
        do {
            try race.run()
        } catch {}
        
        //then
        let result = race.getCurrentStates()
        XCTAssertEqual(result.count, roundCount)
    }
}
