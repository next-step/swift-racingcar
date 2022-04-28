//
//  SetTests.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/04/25.
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

    func testCheckCountOfSet() throws {
        XCTAssertEqual(numbers.count, 3, "numbers의 원소의 개수는 3이 아니다.")
    }
}
