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
	
	func test_shouldTheCountIs3WhenTheInputIs3() {
		let racing = Racing(car: 3)
		XCTAssertEqual(racing.cars.count, 3)
	}
}



/*
 - 주어진 횟수 동안 n대의 자동차는 전진 또는 멈출 수 있습니다.
 - 사용자는 몇 대의 자동차로 몇 번의 이동을 할 것인지를 입력할 수 있어야 합니다.
 - 전진하는 조건은 0에서 9 사이에서 무작위 값을 구한 후 무작위 값이 4 이상일 경우입니다.
 - 자동차의 상태를 화면에 출력합니다. 어느 시점에 출력할 것인지에 대한 제약은 없습니다.
 
 레이싱카를 생각해보자.
 
 
 
 
 */
