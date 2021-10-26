//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by Felix.mr on 2021/10/26.
//

import XCTest

class RacingCarTest: XCTestCase {

    func test_split_stringWithComma() {
        let sut1 = "1,2"
        let sut2 = "1"
        
        XCTAssertEqual(["1", "2"], sut1.splitedWithComma())
        XCTAssertEqual(["1"], sut2.splitedWithComma())
    }
    
    func test_split_stringWithComma_ignoreㅖarentheses() {
        let sut = "(1,2)"
    }
}

// Helper
extension String {
    
    func splitedWithComma() -> [String] {
        return self.split(separator: ",").map { String($0) }
    }
}
