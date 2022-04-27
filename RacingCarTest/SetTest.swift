//
//  SetTest.swift
//  RacingCarTest
//
//  Created by main on 2022/04/27.
//

import XCTest

class SetTest: XCTestCase {
    
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

    func test_count_whenGiveIntSet_thenGetCount() throws {
        // given
        let set = numbers
        
        // when
        
        // then
        XCTAssertEqual(set.count, 3, "Set의 count가 잘못됨")
    }
}

