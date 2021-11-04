//
//  RacingCar.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/03.
//

import Foundation

enum RangeOption {
	static let movementRange: ClosedRange = 4...9
}

class RacingCar {
	private(set) var position: Int = 0
	
	func move(at score: Int) {
		if RangeOption.movementRange.contains(score) {
			position += 1
		}
	}
}
