//
//  SetTests.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/26.
//

import Foundation

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
    
    // Test Case 구현
    func test_Set에_포함된_요소의_갯수를_확인하는_학습테스트() {
        XCTAssertEqual(numbers.count, 3)
    }
}
