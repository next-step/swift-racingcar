//
//  SetTests.swift
//  RacingCarTest
//
//  Created by 강수진 on 2022/04/25.
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
    
    func test_count_whenInsertDuplicateElement_notInsertInDuplicate() throws {
        // given
        
        // when
        
        // then
        let result = numbers.count
        let expectation = 3
        XCTAssertEqual(result, expectation)
    }
}
