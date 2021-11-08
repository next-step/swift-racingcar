//
//  InputCar.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

protocol CarInputable {
	var carNames: [String] { get }
	init(input: String?, nameLengthRange: ClosedRange<Int>, inputableRange: ClosedRange<Int>) throws
}

struct InputCar: CarInputable {
	let carNames: [String]
	
	init(input: String?, nameLengthRange: ClosedRange<Int>, inputableRange: ClosedRange<Int>) throws {
		guard let validInput = input,
					!validInput.isEmpty
		else { throw InputError.invalidName }
		
		let carNames = validInput.convertToCarNames()
		try carNames.isValid(nameLengthRange: nameLengthRange, inputableRange: inputableRange)
		self.carNames = carNames
	}
}

fileprivate extension String {
	func convertToCarNames() -> [String] {
		self.components(separatedBy: ",")
	}
}

fileprivate extension Array where Element == String {
	func isValid(nameLengthRange: ClosedRange<Int>, inputableRange: ClosedRange<Int>) throws {
		guard inputableRange.contains(self.count) else {
			throw InputError.exceededInputableNames
		}
		
		try self.forEach { carName in
			try isValid(carName: carName, in: nameLengthRange)
		}
	}
	
	private func isValid(carName: String, in range: ClosedRange<Int>) throws {
		if !range.contains(carName.count) { throw InputError.outOfMaxLengthName }
	}
}
