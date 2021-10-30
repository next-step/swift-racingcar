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
	
	func test_shouldGetTheCorretResultWhenMultiplyingTwoNumbers() {
		XCTAssertEqual(calculator.multiply(3, 5), 15)
		XCTAssertEqual(calculator.multiply(13, 6), 78)
		XCTAssertEqual(calculator.multiply(220, 31), 6820)
		XCTAssertEqual(calculator.multiply(514, 510), 262140)
	}
	
	func test_shouldGetTheCorretResultWhenDividingTwoNumbers() {
		XCTAssertEqual(calculator.divide(3, 5), 0)
		XCTAssertEqual(calculator.divide(13, 6), 2)
		XCTAssertEqual(calculator.divide(220, 20), 11)
		XCTAssertEqual(calculator.divide(514, 3), 171)
	}
}


