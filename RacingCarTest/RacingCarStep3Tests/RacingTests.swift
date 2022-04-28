//
//  RacingTests.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/04/27.
//

import XCTest

class RacingTests: XCTestCase {

    func testCarNumber() throws {
        let racing = Racing()
        racing.createCars(input: 5)
        XCTAssertEqual(racing.cars.count, 5, "자동차 대수가 다릅니다.")
    }
    
    func testTryCountIsCorrect() throws {
        let racing = Racing()
        racing.inputTryCount(input: 5)
        XCTAssertEqual(racing.tryCount, 5, "시도 횟수가 다릅니다.")
    }
    
    func test_레이싱이_정상적으로_돌아가는지_테스트() throws {
        let racing = Racing()
        racing.createCars(input: 3)
        racing.inputTryCount(input: 3)
        XCTAssertNoThrow(try racing.runRacing { })
    }
}
