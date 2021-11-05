//
//  StubInputView.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/11/05.
//

import Foundation

struct StubInputView: Inputable {
	let numberOfCars: Int
	let numberOfAttempts: Int
	
	func read(completion: (Int, Int) -> Void) throws {
		completion(numberOfCars, numberOfAttempts)
	}
}
