//
//  UserInputValidatorTests.swift
//  RacingCarTest
//
//  Created by 강수진 on 2022/05/01.
//

import XCTest

class UserInputValidatorTests: XCTestCase {
    
    var sut: UserInputValidator!
    
    override func setUpWithError() throws {
        sut = UserInputValidator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isValidRaceCount_whenCountIsZero_toBeFalse() throws {
        // given
        let raceCount = 0
        
        // when
        let result = sut.isValideRaceCount(of: raceCount)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidRaceCount_whenCountIsNegative_toBeFalse() throws {
        // given
        let raceCount = -1
        
        // when
        let result = sut.isValideRaceCount(of: raceCount)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidRaceCount_whenCountIsPositive_toBeTrue() throws {
        // given
        let raceCount = 1
        
        // when
        let result = sut.isValideRaceCount(of: raceCount)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isValidCarNames_whenNameLengthIsFive_toBeTrue() throws {
        // given
        let carNames = ["sujin"]
        
        // when
        let result = sut.isValidCarNames(of: carNames)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isValidCarNames_whenNameLengthIsSix_toBeFalse() throws {
        // given
        let carNames = ["naljin"]
        
        // when
        let result = sut.isValidCarNames(of: carNames)
        
        // then
        XCTAssertFalse(result)
    }
}
