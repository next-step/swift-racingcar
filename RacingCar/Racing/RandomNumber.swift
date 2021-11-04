//
//  RandomNumber.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

protocol Random {
	func rand() -> Int
}

struct RandomNumber: Random {
	private let randomRange: ClosedRange<Int>
	func rand() -> Int {
		Int.random(in: RacingOption.randomNumberRange)
	}
	
	init (range: ClosedRange<Int>) {
		self.randomRange = range
	}
}
