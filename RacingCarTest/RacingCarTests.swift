//
//  RacingCarTests.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/03.
//

import XCTest

class RacingCarTests: XCTestCase {
	let random: Random = RandomNumber(range: 4...4)
	let resultView: Outputable = StubResultView()
	let position: Position = Position(position: RacingOption.defaultRacingCarposition, range: RacingOption.movementRange)
	
	func test_shouldMoveForwardWhenNumberIsGraterThan4() {
		let racingCar = RacingCar()
		racingCar.move(at: 5)
		XCTAssertEqual(racingCar.position.currentPosition, 1)
	}
	
	func test_shoulStopWhenNumberIsLessThan4() {
		let racingCar = RacingCar()
		racingCar.move(at: 3)
		XCTAssertEqual(racingCar.position.currentPosition, 0)
	}
	
	func test_shouldStopWhenNumberIsOutOfRange0Through9() {
		let racingCar = RacingCar()
		racingCar.move(at: 10)
		XCTAssertEqual(racingCar.position.currentPosition, 0)
		
		racingCar.move(at: -9)
		XCTAssertEqual(racingCar.position.currentPosition, 0)
	}
	
	func test_shouldTheCountIs3WhenTheInputIs3() throws {
		let inputCar = try InputCar(input: "3", range: RacingOption.inputCarRange)
		let inputAttempt = try InputAttempt(input: "1", range: RacingOption.inputAttemptRange)
		let inputView: Inputable = StubInputView(numberOfCars: inputCar, numberOfAttempts: inputAttempt)
		let racing = Racing(inputView: inputView, resultView: resultView, random: random)
		XCTAssertEqual(racing.cars.count, 3)
	}
	
	func test_shouldBe1ThePositionOfCarsWhenTheRandomNumberIs4() throws {
		let inputCar = try InputCar(input: "3", range: RacingOption.inputCarRange)
		let inputAttempt = try InputAttempt(input: "1", range: RacingOption.inputAttemptRange)
		let inputView: Inputable = StubInputView(numberOfCars: inputCar, numberOfAttempts: inputAttempt)
		let racing = Racing(inputView: inputView, resultView: resultView, random: random)
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position.currentPosition, 1)
		XCTAssertEqual(racing.cars[1].position.currentPosition, 1)
		XCTAssertEqual(racing.cars[2].position.currentPosition, 1)
	}
	
	func test_shouldBe4ThePositionOfCarsWhenTheNumberOfAttemptsIs4AndRandomNumberIs4() throws {
		let inputCar = try InputCar(input: "3", range: RacingOption.inputCarRange)
		let inputAttempt = try InputAttempt(input: "4", range: RacingOption.inputAttemptRange)
		let inputView: Inputable = StubInputView(numberOfCars: inputCar, numberOfAttempts: inputAttempt)
		let racing = Racing(inputView: inputView, resultView: resultView, random: random)
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position.currentPosition, 4)
		XCTAssertEqual(racing.cars[1].position.currentPosition, 4)
		XCTAssertEqual(racing.cars[2].position.currentPosition, 4)
	}
	
	func test_shouldBeEqualTheNumberOfCarsAndInputNumber() throws {
		let inputCar = try InputCar(input: "3", range: RacingOption.inputCarRange)
		let inputAttempt = try InputAttempt(input: "5", range: RacingOption.inputAttemptRange)
		let inputView: Inputable = StubInputView(numberOfCars: inputCar, numberOfAttempts: inputAttempt)
		let racing = Racing(inputView: inputView, resultView: resultView, random: random)
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position.currentPosition, 5)
		XCTAssertEqual(racing.cars[1].position.currentPosition, 5)
		XCTAssertEqual(racing.cars[2].position.currentPosition, 5)
	}
	
	func test_shouldReturnTheSameNumberOfHyphenAsPositionWhenResultViewBroadcastsPosition() {
		XCTAssertEqual( resultView.broadcast(asPosition: 2), "--")
		XCTAssertEqual( resultView.broadcast(asPosition: 1), "-")
		XCTAssertEqual( resultView.broadcast(asPosition: 0), "")
	}
	
	func test_shouldThrowInvalidErrorWhenInputIsOutOfRange() throws {
		XCTAssertThrowsError(try InputCar(input: "-1", range: RacingOption.inputCarRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.invalid)
		}
		
		XCTAssertThrowsError(try InputCar(input: "11", range: RacingOption.inputCarRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.invalid)
		}
		
		XCTAssertThrowsError(try InputAttempt(input: "-11", range: RacingOption.inputAttemptRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.invalid)
		}
		
		XCTAssertThrowsError(try InputAttempt(input: "21", range: RacingOption.inputAttemptRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.invalid)
		}
	}
}
