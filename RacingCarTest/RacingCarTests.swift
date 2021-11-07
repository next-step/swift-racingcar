//
//  RacingCarTests.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/03.
//

import XCTest

class RacingCarTests: XCTestCase {
	let resultView: Outputable = StubResultView()
	let position: Position = Position(position: RacingOption.defaultRacingCarposition, range: RacingOption.movementRange)
	
	override func tearDownWithError() throws {
		clearVerificationVariables()
	}
	
	func test_shouldMoveForwardWhenNumberIsGraterThanOrEqualTo4() {
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
		let racing = makeRacing(inputCar: "3", inputAttempt: "1")
		XCTAssertEqual(racing.cars.count, 3)
	}
	
	func test_shouldBe1ThePositionOfCarsWhenTheRandomNumberIs4() throws {
		let racing = makeRacing(inputCar: "3", inputAttempt: "1")
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position.currentPosition, 1)
		XCTAssertEqual(racing.cars[1].position.currentPosition, 1)
		XCTAssertEqual(racing.cars[2].position.currentPosition, 1)
	}
	
	func test_shouldBe4ThePositionOfCarsWhenTheNumberOfAttemptsIs4AndRandomNumberIs4() throws {
		let racing = makeRacing(inputCar: "3", inputAttempt: "4")
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position.currentPosition, 4)
		XCTAssertEqual(racing.cars[1].position.currentPosition, 4)
		XCTAssertEqual(racing.cars[2].position.currentPosition, 4)
	}
	
	func test_shouldBeEqualTheNumberOfCarsAndInputNumber() throws {
		let racing = makeRacing(inputCar: "3", inputAttempt: "5")
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
	
	func test_shouldThrowInvalidErrorWhenInputIsOutOfRangeInRacing() throws {
		verifyOccuredInputError(inputCar: "-1")
		verifyOccuredInputError(inputCar: "11")
		verifyOccuredInputError(inputCar: "-11")
		verifyOccuredInputError(inputCar: "21")
	}
	
	private func makeRacing(inputCar: String, inputAttempt: String = "5") -> Racing {
		let randomNumber: Random = RandomNumber(range: 4...4)
		let inputView: Inputable = StubInputView(inputCar: inputCar, inputAttempt: inputAttempt)
		let racing = Racing(inputView: inputView, resultView: resultView, random: randomNumber)
		return racing
	}
	
	private func verifyOccuredInputError(inputCar: String) {
		makeRacing(inputCar: inputCar).raceStart()
		XCTAssertEqual((resultView as? StubResultView)?.occcurredError, InputError.invalid)
		clearVerificationVariables()
	}
	
	private func clearVerificationVariables() {
		(resultView as? StubResultView)?.occcurredError = nil
	}
}
