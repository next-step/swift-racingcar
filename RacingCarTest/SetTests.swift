//
//  SetTests.swift
//  RacingCarTest
//
//  Created by Mephrine on 2021/10/26.
//

import XCTest

class SetTests: XCTestCase {
	private var numbers: Set<Int> = []
	
	override func setUpWithError() throws {
		numbers.removeAll()
		numbers.insert(1)
		numbers.insert(1)
		numbers.insert(2)
		numbers.insert(3)
	}
	
	override func tearDownWithError() throws {
		numbers.removeAll()
	}
	
	func testShouldReturnTrueWhenCountIs3() throws {
		let result = numbers.count
		XCTAssertTrue(result == 3)
	}
	
	func testShouldReturnFalseWhenCountIsAnyOtherNumber() throws {
		let result = numbers.count
		
		for expect in 0 ..< 100 {
			guard expect != 3 else { continue }
			XCTAssertFalse(result == expect)
		}
	}
}
