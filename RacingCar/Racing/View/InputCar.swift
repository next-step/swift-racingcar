//
//  InputCar.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

protocol CarInputable {
	var carNames: [String] { get }
	init(input: String?, range: ClosedRange<Int>) throws
}

struct InputCar: CarInputable {
	let carNames: [String]
	
	init(input: String?, range: ClosedRange<Int>) throws {
		guard let validInput = input,
					!validInput.isEmpty
		else { throw InputError.invalid }
		
		let carNames = validInput.convertToCarNames()
		try carNames.isValid(range: range)
		self.carNames = carNames
	}
}

fileprivate extension String {
	func convertToCarNames() -> [String] {
		self.components(separatedBy: ",")
	}
}

fileprivate extension Array where Element == String {
	func isValid(range: ClosedRange<Int>) throws {
		try self.forEach { carName in
			try isValid(carName: carName, in: range)
		}
	}
	
	private func isValid(carName: String, in range: ClosedRange<Int>) throws {
		if !range.contains(carName.count) {
			throw InputError.outOfMaxLength
		}
	}
}
