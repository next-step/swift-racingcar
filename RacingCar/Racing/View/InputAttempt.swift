//
//  InputAttempt.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

protocol AttemptInputable {
	var numberOfAttempts: Int { get }
	init(input: String?, range: ClosedRange<Int>) throws
}

struct InputAttempt: AttemptInputable {
	let numberOfAttempts: Int
	
	init(input: String?, range: ClosedRange<Int>) throws {
		if let trying: String = input,
			 let numberOfAttempts = Int(trying),
			 range.contains(numberOfAttempts) {
			self.numberOfAttempts = numberOfAttempts
			return
		}
		throw InputError.invalid
	}
}
