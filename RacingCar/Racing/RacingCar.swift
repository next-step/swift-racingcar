//
//  RacingCar.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/03.
//

import Foundation

final class RacingCar {
	private(set) var position: Int = RacingOption.defaultRacingCarposition
	
	func move(at score: Int) {
		if RacingOption.movementRange.contains(score) {
			position += 1
		}
	}
}
