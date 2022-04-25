//
//  SetTests.swift
//  LearningTest
//
//  Created by 이우섭 on 2022/04/25.
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
        
    }
    
    func testCountSetWhenExistDuplicates() {
        XCTAssertEqual(numbers.count, 3)
    }
}
