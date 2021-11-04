//
//  RacingCarTests.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/03.
//

import XCTest

class RacingCarTests: XCTestCase {
	func test_shouldMoveForwardWhenNumberisGraterThan4() {
		let racingCar = RacingCar()
		racingCar.move(at: 5)
		XCTAssertEqual(racingCar.position, 1)
	}
	
	func test_shoulStopWhenNumberIsLessThan4() {
		let racingCar = RacingCar()
		racingCar.move(at: 3)
		XCTAssertEqual(racingCar.position, 0)
	}	
}
