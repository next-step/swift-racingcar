//
//  SplitStringTests.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/10/26.
//

import XCTest

class SplitStringTests: XCTestCase {
	func testSplitStringCase1() {
		let results = "1,2".split(separator: ",")
		let expect: [String.SubSequence] = ["1", "2"]
		
		XCTAssertEqual(results, expect)
		XCTAssert(results == expect)
		XCTAssert(results.contains("1"))
	}
	
	func testSplitStringCase2() {
		let results = "1".split(separator: ",")
		let expect: [String.SubSequence] = ["1"]
		
		XCTAssertEqual(results, expect)
		XCTAssert(results.count == 1)
	}
	
	func testRemoveParentheses() {
		let given = "(1,2)"
		let result = given
			.replacingOccurrences(of: "(", with: "")
			.replacingOccurrences(of: ")", with: "")
		let expect = "1,2"
		
		XCTAssertEqual(result, expect)
	}
}
