//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

protocol Calculable {
	func add(_ lhs: Int, _ rhs: Int) -> Int
	func subtract(_ lhs: Int, _ rhs: Int) -> Int
	func multiply(_ lhs: Int, _ rhs: Int) -> Int
	func divide(_ lhs: Int, _ rhs: Int) -> Int
}

struct Calculator: Calculable {
	func add(_ lhs: Int, _ rhs: Int) -> Int {
		return lhs + rhs
	}
	
	func subtract(_ lhs: Int, _ rhs: Int) -> Int {
		return lhs - rhs
	}
	
	func multiply(_ lhs: Int, _ rhs: Int) -> Int {
		return lhs * rhs
	}
	
	func divide(_ lhs: Int, _ rhs: Int) -> Int {
		return lhs / rhs
	}
}
