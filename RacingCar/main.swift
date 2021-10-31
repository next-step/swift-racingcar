//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

protocol Calculable {
	func calculate(_ input: String?) throws -> Int
}

enum CalculatorError: Error {
	case emptyValue
	case invalidOperand
	case invalidOperator
}

struct Calculator: Calculable {
	// MARK: - Calculate
	func calculate(_ input: String?) throws -> Int {
		guard let expressions = input?.components(separatedBy: " "),
					expressions.count > 0
		else {
			throw CalculatorError.emptyValue
		}
		
		var result = try expressions.first.toInt()
		for i in stride(from: 1, to: expressions.count, by: 2) {
			guard isOperator(expressions[i]) else { throw CalculatorError.invalidOperator }
			guard expressions.count > i + 1 else { throw CalculatorError.invalidOperand }
			
			let operand = try expressions[i + 1].toInt()
			result = try calculate(with: expressions[i])(result, operand)
		}
		
		return result
	}
	
	
	// MARK: - Arithmetic Operation
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
	
	// MARK: - Others
	private func isOperator(_ arithmeticOpearator: String) -> Bool {
		switch(arithmeticOpearator) {
		case "+", "-", "*", "/":
			return true
		default:
			return false
		}
	}
	
	private func calculate(with arithmeticOpearator: String) throws -> (Int, Int) -> Int {
		switch(arithmeticOpearator) {
		case "+":
			return add
		case "-":
			return subtract
		case "*":
			return multiply
		case "/":
			return divide
		default:
			throw CalculatorError.invalidOperator
		}
	}
}

extension Optional where Wrapped == String {
	func toInt() throws -> Int {
		guard let unwrappedString = self else {
			throw CalculatorError.invalidOperand
		}
		return try unwrappedString.toInt()
	}
}

extension String {
	func toInt() throws -> Int {
		guard let unwrappedInt = Int(self) else {
			throw CalculatorError.invalidOperand
		}
		return unwrappedInt
	}
}
