//
//  StubRandom.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

struct StubRandom: Random {
	private let number: Int
	func rand() -> Int {
		self.number
	}
	
	init(number: Int) {
		self.number = number
	}
}
