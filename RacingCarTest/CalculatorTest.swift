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
		XCTAssertEqual(try calculator.calculate("3 + 5"), 8)
		XCTAssertEqual(try calculator.calculate("13 + 6"), 19)
		XCTAssertEqual(try calculator.calculate("220 + 31"), 251)
		XCTAssertEqual(try calculator.calculate("514 + 510"), 1024)
	}
	
	func test_shouldGetTheCorretResultWhenSubtractingTwoNumbers() {
		XCTAssertEqual(try calculator.calculate("5 - 3"), 2)
		XCTAssertEqual(try calculator.calculate("6 - 13"), -7)
		XCTAssertEqual(try calculator.calculate("220 - 31"), 189)
		XCTAssertEqual(try calculator.calculate("510 - 514"), -4)
	}
	
	func test_shouldGetTheCorretResultWhenMultiplyingTwoNumbers() {
		XCTAssertEqual(try calculator.calculate("3 * 5"), 15)
		XCTAssertEqual(try calculator.calculate("13 * 6"), 78)
		XCTAssertEqual(try calculator.calculate("220 * 31"), 6820)
		XCTAssertEqual(try calculator.calculate("514 * 510"), 262140)
	}
	
	func test_shouldGetTheCorretResultWhenDividingTwoNumbers() {
		XCTAssertEqual(try calculator.calculate("3 / 5"), 0)
		XCTAssertEqual(try calculator.calculate("13 / 6"), 2)
		XCTAssertEqual(try calculator.calculate("220 / 20"), 11)
		XCTAssertEqual(try calculator.calculate("514 / 3"), 171)
	}
	
	func test_shouldGetTheResultValueWhenDoingAdditionOnAnExpressionOfTypeString() throws {
		let given = "1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10"
		let result = try calculator.calculate(given)
		let expect = 55
		
		XCTAssertEqual(expect, result)
	}
	
	func test_shouldThrowAnErrorWhenTheInputIsNilOrEmpty() throws {
		XCTAssertThrowsError(try calculator.calculate(nil)) { error in
			XCTAssertEqual(error as! ValueError, ValueError.empty)
		}
		XCTAssertThrowsError(try calculator.calculate("")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.empty)
		}
	}
	
	func test_shouldThrowAnErrorWhenInputIsInvalid() throws {
		XCTAssertThrowsError(try calculator.calculate("+")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalid)
		}
		XCTAssertThrowsError(try calculator.calculate("+ +")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalid)
		}
		XCTAssertThrowsError(try calculator.calculate("+ 1")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalid)
		}
		XCTAssertThrowsError(try calculator.calculate("+ 1 +  + 1")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalid)
		}
		XCTAssertThrowsError(try calculator.calculate("1 + 1 + 1 1")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalid)
		}
		XCTAssertThrowsError(try calculator.calculate("1 + 1 +")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalid)
		}
	}
	
	func test_shouldThrowAnErrorWhenAnInvalidArithmeticOperatorIsIncluded() throws {
		XCTAssertThrowsError(try calculator.calculate("1 // 5")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalidOperator)
		}
		XCTAssertThrowsError(try calculator.calculate("3 ++ 10")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalidOperator)
		}
		XCTAssertThrowsError(try calculator.calculate("1 ! 1")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalidOperator)
		}
		XCTAssertThrowsError(try calculator.calculate("1 @ 3")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalidOperator)
		}
		XCTAssertThrowsError(try calculator.calculate("1 + 2 $ 1 ")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalidOperator)
		}
		XCTAssertThrowsError(try calculator.calculate("1 ^ 1 & 3")) { error in
			XCTAssertEqual(error as! ValueError, ValueError.invalidOperator)
		}
	}
	
	func test_shouldGetTheResultValueWhenAnExpressionOfTypeStringIsGiven() throws {
		let given = "2 + 3 * 4 / 2"
		let result = try calculator.calculate(given)
		let expect = 10
		
		XCTAssertEqual(result, expect)
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
}


