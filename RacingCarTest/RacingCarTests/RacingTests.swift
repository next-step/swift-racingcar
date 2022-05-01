//
//  RacingTests.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/04/27.
//

import XCTest

class RacingTests: XCTestCase {
    
    func test_레이싱_처음부터_잘_돌아가는지_테스트() throws {
        XCTAssertNoThrow(try Racing().start(carCount: 4, tryCount: 4))
    }
}
