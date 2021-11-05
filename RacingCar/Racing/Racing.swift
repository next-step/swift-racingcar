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
	private let totalTrack: Int
	private var track: Int = 1
	
	init(numberOfCars number: Int, numberOfAttempts: Int, random: Random) {
		self.random = random
		self.totalTrack = numberOfAttempts
		makeRacingCars(number)
	}
	
	func raceStart() {
		repeat {
			cars.forEach {
				$0.move(at: random.rand())
			}
			track += 1
		} while (track <= totalTrack)
		track = 1
	}
	
	private func makeRacingCars(_ number: Int) {
		for _ in 0 ..< number {
			let car = RacingCar()
			cars.append(car)
		}
	}
}
