//
//  RacingCarTests.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/03.
//

import XCTest

class RacingCarTests: XCTestCase {
	let random: Random = StubRandom(number: 4)
	
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
		let inputView: Inputable = StubInputView(numberOfCars: 3, numberOfAttempts: 1)
		let racing = Racing(inputView: inputView, random: random)
		XCTAssertEqual(racing.cars.count, 3)
	}
	
	func test_shouldBe1ThePositionOfCarsWhenTheRandomNumberIs4() {
		let inputView: Inputable = StubInputView(numberOfCars: 3, numberOfAttempts: 1)
		let racing = Racing(inputView: inputView, random: random)
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position, 1)
		XCTAssertEqual(racing.cars[1].position, 1)
		XCTAssertEqual(racing.cars[2].position, 1)
	}
	
	func test_shouldBe4ThePositionOfCarsWhenTheNumberOfAttemptsIs4AndRandomNumberIs4() {
		let inputView: Inputable = StubInputView(numberOfCars: 3, numberOfAttempts: 4)
		let racing = Racing(inputView: inputView, random: random)
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position, 4)
		XCTAssertEqual(racing.cars[1].position, 4)
		XCTAssertEqual(racing.cars[2].position, 4)
	}
	
	func test_shouldBeEqualTheNumberOfCarsAndInputNumber() {
		let inputView: Inputable = StubInputView(numberOfCars: 3, numberOfAttempts: 5)
		let racing = Racing(inputView: inputView, random: random)
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position, 5)
		XCTAssertEqual(racing.cars[1].position, 5)
		XCTAssertEqual(racing.cars[2].position, 5)
	}
	
	func test_shouldReturn2HyphenWhenTheNumberOfAttemptsIs2AndRandomNumberIs4() {
		let resultView: Outputable = StubResultView()
		XCTAssertEqual( resultView.broadcast(position: 2), "--")
		XCTAssertEqual( resultView.broadcast(position: 1), "-")
		XCTAssertEqual( resultView.broadcast(position: 0), "")
	}
}
