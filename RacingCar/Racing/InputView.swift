//
//  InputView.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

protocol Inputable {
	func read(completion: (Int, Int) -> Void) throws
}

enum InputError: Error {
	case invalid(message: String)
}

struct InputView: Inputable {
	func read(completion: (Int, Int) -> Void) throws {
		if let numberOfCars = readNumberOfCars(),
			 let numberOfAttempts = readNumberOfAttempts() {
			completion(numberOfCars, numberOfAttempts)
		}
		throw InputError.invalid(message: "올바른 숫자를 입력해주세요.")
	}
	
	func readNumberOfCars() -> Int? {
		print("자동차 대수는 몇 대인가요?", terminator: " ")
		if let cars: String = readLine(),
			 let numberOfCars = Int(cars) {
			return numberOfCars
		}
		return nil
	}
	
	func readNumberOfAttempts() -> Int? {
		print("시도할 횟수는 몇 회인가요?", terminator: " ")
		if let trying: String = readLine(),
			 let numberOfAttempts = Int(trying) {
			return numberOfAttempts
		}
		return nil
	}
}
