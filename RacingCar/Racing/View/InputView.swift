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
	case invalidNumber
	case invalidName
	case outOfMaxLengthName
	case exceededInputableNames
	case duplicatedName
}

struct InputView: Inputable {
	func readNumberOfCars() throws -> InputCar {
		print("경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분).")
		return try InputCar(input: readLine(), nameLengthRange: RacingOption.carNameRange, inputableRange: RacingOption.inputCarRange)
	}
	
	func readNumberOfAttempts() throws -> InputAttempt {
		print("시도할 횟수는 몇 회인가요?")
		return try InputAttempt(input: readLine(), range: RacingOption.inputAttemptRange)
	}
}
