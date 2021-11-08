//
//  RacingOption.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation


enum RacingOption {
	static let randomNumberRange: ClosedRange = 0...9
	static let movementRange: ClosedRange = 4...9
	static let carNameRange: ClosedRange = 1...5
	static let inputAttemptRange: ClosedRange = 1...20
	static let startingTrack: Int = 1
	static let defaultTotalTrack: Int = 0
	static let defaultRacingCarposition: Int = 0
	static let outputSymbol: String = "-"
}
