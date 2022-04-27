//
//  StringTest.swift
//  RacingCarTest
//
//  Created by main on 2022/04/27.
//

import XCTest

class StringTest: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_split_whenContainSeparator_thenGetSeparatedArray() throws {
        // given
        let string = "1,2"
        
        // when
        let result = string.split(separator: ",")
        
        // then
        XCTAssertEqual(result, ["1", "2"], "separator가 포함된 문자열을 split으로 쪼갠 결과가 잘못됨")
    }

    func test_split_whenNotContainSeparator_thenGetSeparatedArray() throws {
        // given
        let string = "1"
        
        // when
        let result = string.split(separator: ",")
        
        // then
        XCTAssertEqual(result, ["1"], "separator가 포함되지 않은 문자열을 split으로 쪼갠 결과가 잘못됨")
    }
    
    func test_replace_split_whenContain제거되어야할문자와구분자_thenGetReplacedSeparatedArray() throws {
        // given
        let string = "(1,2)"
        
        // when
        let result = string
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .split(separator: ",")
        
        // then
        XCTAssertEqual(result, ["1", "2"], "replacingOccurrences와 split을 진행한 결과가 잘못됨")
    }
}
