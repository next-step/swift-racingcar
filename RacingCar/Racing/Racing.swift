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
	
	// MARK: - Initialize
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
	
	// MARK: - Public
	func raceStart() {
		startBroadcasting()
		racing()
		raceEnd()
	}
	
	// MARK: - Private
	private func printMessage(for error: Error) {
		guard let inputError = error as? InputError else { return }
		resultView.broadcast(asError: inputError)
	}
	
	private func startBroadcasting() {
		resultView.startedBroadcasting()
	}
	
	private func racing() {
		while (track <= totalTrack) {
			cars.forEach {
				$0.move(at: random.rand())
				_ = resultView.broadcast(asPosition: $0.position)
			}
			passTrack()
		}
	}
	
	private func passTrack() {
		track += 1
		resultView.broadcastThatCarsHasPassedTrack()
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
}
