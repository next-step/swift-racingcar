//
//  RacingCar.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/03.
//

import Foundation

final class RacingCar {
	private(set) var position: Position = Position(position: RacingOption.defaultRacingCarposition, range: RacingOption.movementRange)
	let name: String
	
	init(name: String) {
		self.name = name
	}
	
	func move(at score: Int) {
		position.increase(at: score)
	}
}
