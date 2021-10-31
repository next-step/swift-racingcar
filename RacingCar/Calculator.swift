//
//  Calculator.swift
//  RacingCar
//
//  Created by Mephrine on 2021/10/31.
//

import Foundation

protocol Calculable {
	func calculate(_ input: String?) throws -> Int
}

struct Calculator: Calculable {
	// MARK: - Calculate
	func calculate(_ input: String?) throws -> Int {
		guard let expressions = input?.components(separatedBy: " "),
					expressions.count > 0
		else {
			throw ValueError.empty
		}
		
		return try calculate(by: expressions)
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
	private func calculate(by expressions: [String]) throws -> Int {
		var result = try expressions.first.toInt()
		for i in findOperatorRange(in: expressions) {
			guard expressions.count > i + 1 else { throw ValueError.invalid }
			
			let operand = try expressions[i + 1].toInt()
			let arithmeticOperator = try find(opearator: expressions[i])
			result = arithmeticOperator(result, operand)
		}
		
		return result
	}
	
	private func findOperatorRange(in expressions: [String]) -> StrideTo<Int> {
		return stride(from: 1, to: expressions.count, by: 2)
	}
	
	private func find(opearator arithmeticOpearator: String) throws -> (Int, Int) -> Int {
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
			throw ValueError.invalidOperator
		}
	}
}
