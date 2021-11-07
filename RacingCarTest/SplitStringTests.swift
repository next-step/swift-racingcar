//
//  SplitStringTests.swift
//  RacingCarTest
//
//  Created by Felix.mr on 2021/10/26.
//

import XCTest

class SplitStringTests: XCTestCase {
    
    func test_split_stringWithComma() {
        let sut1 = "1,2"
        let sut2 = "1"
        
        XCTAssertEqual(["1", "2"], sut1.splitedWithComma())
        XCTAssertEqual(["1"], sut2.splitedWithComma())
    }
    
    func test_split_stringWithComma_ignoreParentheses() {
        let sut = "(1,2)"
        
        let sut1 = sut.replacingMultipleOccurrences(of: ["(", ")"], with: "")
        
        XCTAssertEqual(["1", "2"], sut1.splitedWithComma())
    }
}

// Helper
extension String {
    
    func replacingMultipleOccurrences(of targets: [String], with: String) -> String {
        return self.map {
            if targets.contains(String($0)) {
                return ""
            }
            
            return String($0)
        }.joined()
    }
    
    func splitedWithComma() -> [String] {
        return self.split(separator: ",").map { String($0) }
    }
}
