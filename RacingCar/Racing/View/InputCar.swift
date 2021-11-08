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
		guard isNotExceededInputableNamesError(range: inputableRange) else { throw InputError.exceededInputableNames }
		guard isNotDuplicatedNameError() else { throw InputError.duplicatedName }
		
		try self.forEach { carName in
			try isValid(carName: carName, in: nameLengthRange)
		}
	}
	
	private func isNotExceededInputableNamesError(range: ClosedRange<Int>) -> Bool {
		range.contains(self.count)
	}
	
	private func isNotDuplicatedNameError() -> Bool {
		self.count == Set(self).count
	}
	
	private func isValid(carName: String, in range: ClosedRange<Int>) throws {
		if !range.contains(carName.count) { throw InputError.outOfMaxLengthName }
	}
}
