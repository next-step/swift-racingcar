//
//  SetTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/10/26.
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
    
    func test_set_count() {
        XCTAssertEqual(numbers.count, 3)
    }
}
