//
//  StubInputView.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

struct StubInputView: Inputable {
	let numberOfCars: CarInputable
	let numberOfAttempts: AttemptInputable
	
	func read(completion: (CarInputable, AttemptInputable) -> Void) throws {
		completion(numberOfCars, numberOfAttempts)
	}
}
