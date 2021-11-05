//
//  Racing.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/04.
//

import Foundation

class Racing {
	// MARK: - Properties
	private let random: Random
	private let resultView: Outputable
	private(set) var cars: [RacingCar] = []
	private var totalTrack: Int = RacingOption.defaultTotalTrack
	private var track: Int = RacingOption.startingTrack
	
	init(inputView: Inputable, resultView: Outputable, random: Random) {
		self.random = random
		self.resultView = resultView
		do {
			try inputView.read { numberOfCars, numberOfAttempts in
				self.totalTrack = numberOfAttempts
				self.makeRacingCars(numberOfCars)
			}
		} catch (let error) {
			printMessage(for: error)
		}
	}
	
	func raceStart() {
		while (track <= totalTrack) {
			cars.forEach {
				$0.move(at: random.rand())
			}
			track += 1
		}
		
		raceEnd()
	}
	
	private func raceEnd() {
		totalTrack = RacingOption.defaultTotalTrack
		track = RacingOption.startingTrack
	}
	
	private func makeRacingCars(_ number: Int) {
		for _ in 0 ..< number {
			let car = RacingCar()
			cars.append(car)
		}
	}
	
	private func printMessage(for error: Error) {
		guard let inputError = error as? InputError else { return }
		switch inputError {
		case .invalid(let message):
			print(message)
		}
	}
}
