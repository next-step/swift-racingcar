//
//  SetTests.swift
//  LearningTest
//
//  Created by hakyung on 2022/04/26.
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

    func testSetCount() throws {
        XCTAssertEqual(numbers.count, 3)
    }

}
