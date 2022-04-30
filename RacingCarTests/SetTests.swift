//
//  SetTests.swift
//  RacingCarTests
//
//  Created by 박정연 on 2022/04/30.
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

    func testCount() {
        XCTAssertEqual(numbers.count, 3)
    }
}
