//
//  RacingCarTests.swift
//  RacingCarTests
//
//  Created by ycsong on 2022/04/28.
//

import XCTest
@testable import RacingCar

class RacingCarTests: XCTestCase {
    
    func testIsValidRandomNumber() throws {
        let randomNumber = Game.generateRandomNumer()
        XCTAssertTrue(randomNumber >= 0 && randomNumber <= 9)
    }
    
}
