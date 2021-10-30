//
//  CalculatorTest.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/10/28.
//

import XCTest

class CalculatorTest: XCTestCase {
	let calculator: Calculable = Calculator()
	
	func test_shouldGetTheCorretResultWhenAddingTwoNumbers() {
		XCTAssertEqual(calculator.add(3, 5), 8)
		XCTAssertEqual(calculator.add(13, 6), 19)
		XCTAssertEqual(calculator.add(220, 31), 251)
		XCTAssertEqual(calculator.add(514, 510), 1024)
	}
	
	func test_shouldGetTheCorretResultWhenSubtractingTwoNumbers() {
		XCTAssertEqual(calculator.subtract(5, 3), 2)
		XCTAssertEqual(calculator.subtract(6, 13), -7)
		XCTAssertEqual(calculator.subtract(220, 31), 189)
		XCTAssertEqual(calculator.subtract(510, 514), -4)
	}
}


