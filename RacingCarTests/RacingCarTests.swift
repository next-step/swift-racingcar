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
        let randomNumber = GameOption.generateRandomNumber()
        XCTAssertTrue(randomNumber >= 0 && randomNumber <= 9)
    }
        
    func testCanGoFoward() throws {
        let result = GameOption.canGoFoward(4)
        XCTAssertTrue(result)
    }
    
}
