//
//  RacingCarTests.swift
//  RacingCarTests
//
//  Created by itzel.du on 2021/10/26.
//

import XCTest

class RacingCarTests: XCTestCase {
    
    func test_split_stringByComma_whenThereIsComma() throws {
        let numbersString = "1,2"
        let numbers = numbersString.split(separator: ",").map { String($0) }
        
        XCTAssertEqual(numbers, ["1", "2"])
    }

    func test_split_stringByComma_whenThereIsNoComma() throws {
        let numberString = "1"
        let number = numberString.split(separator: ",").map { String($0) }
        
        XCTAssert(number == ["1"])
    }
    
    func test_replacingOccurrences_whenThereIsTarget() {
        let numbersStringContainingBrackets = "(1,2)"
        let numbersString = numbersStringContainingBrackets.replacingOccurrences(of: ["(", ")"], with: "")
        
        XCTAssertEqual(numbersString, "1,2")
    }
}

private extension String {
    
    func replacingOccurrences(of targets: [String], with replacement: String) -> String {
        var replacedString = self
        targets.forEach { target in
            replacedString = replacedString.replacingOccurrences(of: target, with: replacement)
        }
        
        return replacedString
    }
}
