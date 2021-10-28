//
//  SplitStringTests.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/10/26.
//

import XCTest

class SplitStringTest: XCTestCase {
	func testSplitStringCase1() {
		let results = "1,2".split(separator: ",")
		let expects: [String.SubSequence] = ["1", "2"]
		
		XCTAssertEqual(results, expects)
		XCTAssert(results == expects)
		XCTAssert(results.contains("1"))
	}
	
	func testSplitStringCase2() {
		let results = "1".split(separator: ",")
		let expects: [String.SubSequence] = ["1"]
		
		XCTAssertEqual(results, expects)
		XCTAssert(results.count == 1)
	}
	
	func testRemoveParentheses() {
		let given = "(1,2)"
		let results = given
			.replacingOccurrences(of: "(", with: "")
			.replacingOccurrences(of: ")", with: "")
		let expects = "1,2"
		
		XCTAssertEqual(results, expects)
	}
}
