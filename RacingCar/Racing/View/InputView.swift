//
//  InputView.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

protocol Inputable {
	func read(completion: (CarInputable, AttemptInputable) -> Void) throws
	func readNumberOfCars() throws -> InputCar
	func readNumberOfAttempts() throws -> InputAttempt
}

extension Inputable {
	func read(completion: (CarInputable, AttemptInputable) -> Void) throws {
		let inputCar = try readNumberOfCars()
		let inputAttempt = try readNumberOfAttempts()
		
		completion(inputCar, inputAttempt)
	}
}

enum InputError: Error {
	case invalid
}

struct InputView: Inputable {
	func readNumberOfCars() throws -> InputCar {
		print("자동차 대수는 몇 대인가요?", terminator: " ")
		return try InputCar(input: readLine(), range: RacingOption.inputCarRange)
	}
	
	func readNumberOfAttempts() throws -> InputAttempt {
		print("시도할 횟수는 몇 회인가요?", terminator: " ")
		return try InputAttempt(input: readLine(), range: RacingOption.inputAttemptRange)
	}
}
