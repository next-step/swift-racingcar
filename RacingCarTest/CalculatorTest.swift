//
//  CalculatorTest.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/10/28.
//

import XCTest

class CalculatorTest: XCTestCase {
	let mockCalculator: Calculable = Calculator()
	
	func test_shouldGetTheCorretResultWhenAddingTwoNumbers() throws {
		let addedResult = mockCalculator.add(3, 5)
		let result = 8
		XCTAssertEqual(addedNumber, result)
	}
}


