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
	
	// MARK: - Private
	private func calculate(by expressions: [String]) throws -> Int {
		var result = try expressions.first.toInt()
		for i in findOperatorRange(in: expressions) {
			guard expressions.count > i + 1 else { throw ValueError.invalid }
			
			let operand = try expressions[i + 1].toInt()
			let arithmeticOperator = findOperator(in: expressions[i])
			result = try arithmeticOperator.operate(result, operand)
		}
		
		return result
	}
	
	private func findOperatorRange(in expressions: [String]) -> StrideTo<Int> {
		return stride(from: 1, to: expressions.count, by: 2)
	}
	
	private func findOperator(in expressions: String) -> ArithmeticOpearator {
		ArithmeticOpearator(rawValue: expressions) ?? .none
	}
}
