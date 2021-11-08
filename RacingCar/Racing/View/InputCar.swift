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
		guard let carNames = input.convertToCarNames(),
					try carNames.isValid()
		else { throw InputError.invalid }
		
		self.carNames = carNames
	}
}

fileprivate extension Optional where Wrapped == String {
	func convertToCarNames() -> [String]? {
		self?.components(separatedBy: ",")
	}
}

fileprivate extension Array where Element == String {
	func isValid() throws -> Bool {
		try self.forEach { carName in
			if isValid(carName: carName) { throw InputError.outOfMaxLength }
		}
		return true
	}
	
	private func isValid(carName: String) -> Bool {
		RacingOption.carNameRange.contains(carName.count)
	}
}
