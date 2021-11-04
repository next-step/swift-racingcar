//
//  Racing.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/04.
//

import Foundation

class Racing {
	var cars: [RacingCar] = []
	
	init(numberOfCar number: Int) {
		makeRacingCars(number)
	}
	
	private func makeRacingCars(_ number: Int) {
		for _ in 0 ..< number {
			let car = RacingCar()
			cars.append(car)
		}
	}
}
