//
//  StubInputView.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

struct StubInputView: Inputable {
	let carNames: String?
	let numberOfAttempts: String?
	
	init(inputCarNames: String?, inputAttempt: String?) {
		self.carNames = inputCarNames
		self.numberOfAttempts = inputAttempt
	}
	
	func readNumberOfCars() throws -> InputCar {	
		return try InputCar(input: carNames, nameLengthRange: RacingOption.carNameRange, inputableRange: RacingOption.inputCarRange)
	}
	
	func readNumberOfAttempts() throws -> InputAttempt {
		return try InputAttempt(input: numberOfAttempts, range: RacingOption.inputAttemptRange)
	}
}
