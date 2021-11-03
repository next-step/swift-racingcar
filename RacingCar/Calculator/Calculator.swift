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
					expressions.isNotEmpty()
		else {
			throw ValueError.empty
		}
		
		return try calculate(by: expressions)
	}
	
	// MARK: - Private
	private func calculate(by expressions: [String]) throws -> Int {
		var result = try expressions.first.toInt()
		for operatorIndex in findOperatorRange(in: expressions) {
			let operandRHS = try findOperandRHS(by: operatorIndex, in: expressions)
			let operands = (lhs: result, rhs: operandRHS)
			let arithmeticOperator = try findOperator(in: expressions[operatorIndex])
			
			result = try arithmeticOperator.operate(operands.lhs, operands.rhs)
		}
		
		return result
	}
	
	private func findOperandRHS(by operatorIndex: Int, in expressions: [String]) throws -> Int {
		let operandRHSIndex = operatorIndex + 1
		guard expressions.count > operandRHSIndex,
					let operandRHS = try? expressions[operandRHSIndex].toInt()
		else {
			throw ValueError.invalid
		}
		return operandRHS
	}
	
	private func findOperatorRange(in expressions: [String]) -> StrideTo<Int> {
		return stride(from: 1, to: expressions.count, by: 2)
	}
	
	private func findOperator(in expression: String) throws -> ArithmeticOpearator {
		guard let arithmeticOperator = OpeatorSymbol(rawValue: expression)?.makeOperator() else {
			throw ValueError.invalidOperator
		}
		return arithmeticOperator
	}
}
