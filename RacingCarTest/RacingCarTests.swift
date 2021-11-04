//
//  RacingCarTests.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/03.
//

import XCTest

class RacingCarTests: XCTestCase {
	func test_shouldMoveForwardWhenNumberIsGraterThan4() {
		let racingCar = RacingCar()
		racingCar.move(at: 5)
		XCTAssertEqual(racingCar.position, 1)
	}
	
	func test_shoulStopWhenNumberIsLessThan4() {
		let racingCar = RacingCar()
		racingCar.move(at: 3)
		XCTAssertEqual(racingCar.position, 0)
	}
	
	func test_shouldStopWhenNumberIsOutOfRange0Through9() {
		let racingCar = RacingCar()
		racingCar.move(at: 10)
		XCTAssertEqual(racingCar.position, 0)
		
		racingCar.move(at: -9)
		XCTAssertEqual(racingCar.position, 0)
	}
	
	func test_shouldTheCountIs3WhenTheInputIs3() {
		let racing = Racing(numberOfCar: 3)
		XCTAssertEqual(racing.cars.count, 3)
	}
}
