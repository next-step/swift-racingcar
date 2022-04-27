//
//  SetTest.swift
//  RacingCarTest
//
//  Created by 김성준 on 2022/04/26.
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
    
    func test_Set에_1223을_삽입하면_요소개수가_3개가_되는가() {
        //given
        //when
        //then
        XCTAssertEqual(numbers.count, 3)
    }
}
