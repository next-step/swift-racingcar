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
		let racingCar = RacingCar(name: "yagom")
		racingCar.move(at: 5)
		XCTAssertEqual(racingCar.position.currentPosition, 1)
	}
	
	func test_shoulStopWhenNumberIsLessThan4() {
		let racingCar = RacingCar(name: "yagom")
		racingCar.move(at: 3)
		XCTAssertEqual(racingCar.position.currentPosition, 0)
	}
	
	func test_shouldStopWhenNumberIsOutOfRange0Through9() {
		let racingCar = RacingCar(name: "yagom")
		racingCar.move(at: 10)
		XCTAssertEqual(racingCar.position.currentPosition, 0)
		
		racingCar.move(at: -9)
		XCTAssertEqual(racingCar.position.currentPosition, 0)
	}
	
	func test_shouldTheCountIs3WhenTheInputIs3() throws {
		let racing = makeRacing(inputCarNames: "yagom,cozy,jinie", inputAttempt: "1")
		XCTAssertEqual(racing.cars.count, 3)
	}
	
	func test_shouldBe1ThePositionOfCarsWhenTheRandomNumberIs4() throws {
		let racing = makeRacing(inputCarNames: "yagom,cozy,jinie", inputAttempt: "1")
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position.currentPosition, 1)
		XCTAssertEqual(racing.cars[1].position.currentPosition, 1)
		XCTAssertEqual(racing.cars[2].position.currentPosition, 1)
	}
	
	func test_shouldBe4ThePositionOfCarsWhenTheNumberOfAttemptsIs4AndRandomNumberIs4() throws {
		let racing = makeRacing(inputCarNames: "yagom,cozy,jinie", inputAttempt: "4")
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position.currentPosition, 4)
		XCTAssertEqual(racing.cars[1].position.currentPosition, 4)
		XCTAssertEqual(racing.cars[2].position.currentPosition, 4)
	}
	
	func test_shouldBeEqualTheNumberOfCarsAndInputNumber() throws {
		let racing = makeRacing(inputCarNames: "yagom,cozy,jinie", inputAttempt: "5")
		racing.raceStart()
		
		XCTAssertEqual(racing.cars[0].position.currentPosition, 5)
		XCTAssertEqual(racing.cars[1].position.currentPosition, 5)
		XCTAssertEqual(racing.cars[2].position.currentPosition, 5)
	}
	
	func test_shouldReturnTheSameNumberOfHyphenAsPositionWhenResultViewBroadcastsPosition() {
		XCTAssertEqual( resultView.broadcast(position: 2, of: ""), "--")
		XCTAssertEqual( resultView.broadcast(position: 1, of: ""), "-")
		XCTAssertEqual( resultView.broadcast(position: 0, of: ""), "")
	}
	
	func test_shouldThrowInvalidErrorWhenInputCarIsNilOrEmpty() throws {
		XCTAssertThrowsError(try InputCar(input: "", nameLengthRange: RacingOption.carNameRange, inputableRange: RacingOption.inputCarRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.invalidName)
		}
		
		XCTAssertThrowsError(try InputCar(input: nil, nameLengthRange: RacingOption.carNameRange, inputableRange: RacingOption.inputCarRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.invalidName)
		}
	}
	
	func test_shouldThrowInvalidErrorWhenInputAttemptInputIsOutOfRange() throws {
		XCTAssertThrowsError(try InputAttempt(input: "-11", range: RacingOption.inputAttemptRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.invalidNumber)
		}
		
		XCTAssertThrowsError(try InputAttempt(input: "21", range: RacingOption.inputAttemptRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.invalidNumber)
		}
	}
	
	func test_shouldThrowOutOfMaxLengthErrorWhenLengthOfInputCarNameIsOutOfRange() throws {
		XCTAssertThrowsError(try InputCar(input: "-11-1-1-1aa", nameLengthRange: RacingOption.carNameRange, inputableRange: RacingOption.inputCarRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.outOfMaxLengthName)
		}
		
		XCTAssertThrowsError(try InputCar(input: "212121", nameLengthRange: RacingOption.carNameRange, inputableRange: RacingOption.inputCarRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.outOfMaxLengthName)
		}
	}
	
	func test_shouldThrowInvalidErrorWhenInputIsNilOrEmptyInRacing() throws {
		verifyOccuredInputError(inputCar: "", expectError: InputError.invalidName)
		verifyOccuredInputError(inputCar: nil, expectError: InputError.invalidName)
	}
	
	func test_shouldThrowOutOfMaxLengthErrorWhenLengthOfInputCarNameIsOutOfRangeInRacing() throws {
		verifyOccuredInputError(inputCar: "-11-1-1-1aa", expectError: InputError.outOfMaxLengthName)
		verifyOccuredInputError(inputCar: "212121", expectError: InputError.outOfMaxLengthName)
	}
	
	func test_shouldThrowExceededInputableNamesErrorWhenInputCarIsOutOfRange() throws {
		XCTAssertThrowsError(try InputCar(input: "1,2,3,4,5,6,7,8,9,10,11", nameLengthRange: RacingOption.carNameRange, inputableRange: RacingOption.inputCarRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.exceededInputableNames)
		}
		
		XCTAssertThrowsError(try InputCar(input: "abcde,fghij,klmno,pqrst,uvwxy,z,1,2,3,4,5,6,7,8,9,10", nameLengthRange: RacingOption.carNameRange, inputableRange: RacingOption.inputCarRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.exceededInputableNames)
		}
	}
	
	func test_shouldThrowExceededInputableNamesErrorWhenInputIsOutOfRangeInRacing() throws {
		verifyOccuredInputError(inputCar: "1,2,3,4,5,6,7,8,9,10,11", expectError: InputError.exceededInputableNames)
		verifyOccuredInputError(inputCar: "abcde,fghij,klmno,pqrst,uvwxy,z,1,2,3,4,5,6,7,8,9,10", expectError: InputError.exceededInputableNames)
	}
	
	func test_shouldThrowDuplicatedNameErrorWhenThereAreDuplicateNamesInTheInput() throws {
		XCTAssertThrowsError(try InputCar(input: "1,1,3,4,5,6,7,8,9,10", nameLengthRange: RacingOption.carNameRange, inputableRange: RacingOption.inputCarRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.duplicatedName)
		}
		
		XCTAssertThrowsError(try InputCar(input: "abcde,fghi,z,x,c,abcde,y", nameLengthRange: RacingOption.carNameRange, inputableRange: RacingOption.inputCarRange)) { error in
			XCTAssertEqual(error as! InputError, InputError.duplicatedName)
		}
	}
	
	func test_shouldThrowDuplicatedNamesErrorWhenThereAreDuplicateNamesInTheInput() throws {
		verifyOccuredInputError(inputCar: "1,1,3,4,5,6,7,8,9,10", expectError: InputError.duplicatedName)
		verifyOccuredInputError(inputCar: "abcde,fghi,z,x,c,abcde,y", expectError: InputError.duplicatedName)
	}
	
	func test_shouldGet3CarsWhenInput3Names() {
		let racing = makeRacing(inputCarNames: "yagom,cozy,jinie", inputAttempt: "5")
		XCTAssertEqual(racing.cars.count, 3)
		XCTAssertEqual(racing.cars.map { $0.name }, ["yagom", "cozy", "jinie"])
	}
	
	func test_shouldGetNamesOfWinnersWhenRaceIsOver() {
		let racing = makeRacing(inputCarNames: "yagom,cozy,jinie", inputAttempt: "5")
		racing.raceStart()
		XCTAssertEqual(racing.namesOfWinners, ["yagom", "cozy", "jinie"])
	}
	
	private func makeRacing(inputCarNames: String?, inputAttempt: String? = "5") -> Racing {
		let randomNumber: Random = RandomNumber(range: 4...4)
		let inputView: Inputable = StubInputView(inputCarNames: inputCarNames, inputAttempt: inputAttempt)
		let racing = Racing(inputView: inputView, resultView: resultView, random: randomNumber)
		return racing
	}
	
	private func verifyOccuredInputError(inputCar: String?, expectError: InputError) {
		makeRacing(inputCarNames: inputCar).raceStart()
		XCTAssertEqual((resultView as? StubResultView)?.occcurredError, expectError)
		clearVerificationVariables()
	}
	
	private func clearVerificationVariables() {
		(resultView as? StubResultView)?.occcurredError = nil
	}
}
