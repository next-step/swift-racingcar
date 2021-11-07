//
//  StubInputView.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

struct StubInputView: Inputable {
	let numberOfCars: String
	let numberOfAttempts: String
	
	init(inputCar: String, inputAttempt: String) {
		self.numberOfCars = inputCar
		self.numberOfAttempts = inputAttempt
	}
	
	func readNumberOfCars() throws -> InputCar {	
		return try InputCar(input: numberOfCars, range: RacingOption.inputCarRange)
	}
	
	func readNumberOfAttempts() throws -> InputAttempt {
		return try InputAttempt(input: numberOfAttempts, range: RacingOption.inputAttemptRange)
	}
}
