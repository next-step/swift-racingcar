//
//  String+Extension.swift
//  RacingCar
//
//  Created by Mephrine on 2021/10/31.
//

import Foundation

extension Optional where Wrapped == String {
	func toInt() throws -> Int {
		guard let unwrappedString = self else {
			throw ValueError.invalid
		}
		return try unwrappedString.toInt()
	}
}

extension String {
	func toInt() throws -> Int {
		guard let unwrappedInt = Int(self) else {
			throw ValueError.invalid
		}
		return unwrappedInt
	}
}
