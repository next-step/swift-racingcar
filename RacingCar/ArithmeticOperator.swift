//
//  ArithmeticOperator.swift
//  RacingCar
//
//  Created by Mephrine on 2021/11/01.
//

import Foundation

enum ArithmeticOpearator: String {
	case addition = "+"
	case subtraction = "-"
	case multiplication = "*"
	case division = "/"
	case none
	
	func operate(_ lhs: Int, _ rhs: Int) throws -> Int {
		switch self {
		case .addition:
			return add(lhs, rhs)
		case .subtraction:
			return subtract(lhs, rhs)
		case .multiplication:
			return multiply(lhs, rhs)
		case .division:
			return divide(lhs, rhs)
		case .none:
			throw ValueError.invalidOperator
		}
	}
	
	private func add(_ lhs: Int, _ rhs: Int) -> Int {
		return lhs + rhs
	}
	
	private func subtract(_ lhs: Int, _ rhs: Int) -> Int {
		return lhs - rhs
	}
	
	private func multiply(_ lhs: Int, _ rhs: Int) -> Int {
		return lhs * rhs
	}
	
	private func divide(_ lhs: Int, _ rhs: Int) -> Int {
		return lhs / rhs
	}
}
