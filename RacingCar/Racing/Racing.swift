//
//  Racing.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/04.
//

import Foundation

class Racing {
	private(set) var cars: [RacingCar] = []
	private let random: Random
	
	init(numberOfCar number: Int, random: Random) {
		self.random = random
		makeRacingCars(number)
	}
	
	func raceStart() {
		cars.forEach {
			$0.move(at: random.rand())
		}
	}
	
	private func makeRacingCars(_ number: Int) {
		for _ in 0 ..< number {
			let car = RacingCar()
			cars.append(car)
		}
	}
}
