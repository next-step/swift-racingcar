//
//  StringTests.swift
//  RacingCarTest
//
//  Created by 강수진 on 2022/04/25.
//

import XCTest

class StringTests: XCTestCase {

    func test_split_whenStringContainsSeparator_returnsArraySplitBySeparator() throws {
        // given
        let input = "1,2"
        
        // when
        let separator: Character = ","
        let result = input.split(separator: separator)
        
        // then
        let expectation: [String.SubSequence] = ["1", "2"]
        XCTAssertEqual(result, expectation)
    }

    func test_split_whenStringNotContainSeparator_returnsArrayOfSingleString() throws {
        // given
        let input = "1"
        
        // when
        let separator: Character = ","
        let result = input.split(separator: separator)
        
        // then
        let expectation: [String.SubSequence] = ["1"]
        XCTAssert(result == expectation)
    }
}
