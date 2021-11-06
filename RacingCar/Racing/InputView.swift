//
//  InputView.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

protocol Inputable {
	func read(completion: (CarInputable, AttemptInputable) -> Void) throws
}

enum InputError: Error {
	case invalid
}

protocol CarInputable {
	var numberOfCars: Int { get }
	init(input: String?, range: ClosedRange<Int>) throws
}

struct InputCar: CarInputable {
	let numberOfCars: Int
	
	init(input: String?, range: ClosedRange<Int>) throws {
		if let cars: String = input,
			 let numberOfCars = Int(cars),
			 range.contains(numberOfCars) {
			self.numberOfCars = numberOfCars
			return
		}
		throw InputError.invalid
	}
}

protocol AttemptInputable {
	var numberOfAttempts: Int { get }
	init(input: String?, range: ClosedRange<Int>) throws
}

struct InputAttempt: AttemptInputable {
	let numberOfAttempts: Int
	
	init(input: String?, range: ClosedRange<Int>) throws {
		if let trying: String = input,
			 let numberOfAttempts = Int(trying),
			 range.contains(numberOfAttempts) {
			self.numberOfAttempts = numberOfAttempts
			return
		}
		throw InputError.invalid
	}
}

struct InputView: Inputable {
	func read(completion: (CarInputable, AttemptInputable) -> Void) throws {
		let inputCar = try readNumberOfCars()
		let inputAttempt = try readNumberOfAttempts()
		
		completion(inputCar, inputAttempt)
	}
	
	private func readNumberOfCars() throws -> InputCar {
		print("자동차 대수는 몇 대인가요?", terminator: " ")
		return try InputCar(input: readLine(), range: RacingOption.inputCarRange)
	}
	
	private func readNumberOfAttempts() throws -> InputAttempt {
		print("시도할 횟수는 몇 회인가요?", terminator: " ")
		return try InputAttempt(input: readLine(), range: RacingOption.inputAttemptRange)
	}
}
