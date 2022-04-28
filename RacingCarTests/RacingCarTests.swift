//
//  RacingCarTests.swift
//  RacingCarTests
//
//  Created by ycsong on 2022/04/28.
//

import XCTest
@testable import RacingCar

class RacingCarTests: XCTestCase {

    func testIsValidInput() throws {
        let input = try InputView.inputValidTest("5")
        XCTAssertTrue(input == 5)
    }
    
}
