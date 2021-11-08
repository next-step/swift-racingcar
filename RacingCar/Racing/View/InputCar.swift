//
//  InputCar.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

protocol CarInputable {
	var numberOfCars: Int { get }
	init(input: String?, range: ClosedRange<Int>) throws
}

struct InputCar: CarInputable {
	let numberOfCars: Int
	
	init(input: String?, range: ClosedRange<Int>) throws {
		guard let cars: String = input,
					let numberOfCars = Int(cars),
					range.contains(numberOfCars)
		else { throw InputError.invalid }
		
		self.numberOfCars = numberOfCars
	}
}
