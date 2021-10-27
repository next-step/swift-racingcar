//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by sangsun on 2021/10/27.
//

import XCTest

class RacingCarTest: XCTestCase {

    func test_요구사항1_split을_통한_분리_1() throws {
        let input = "1,2".split(separator: ",")
        let expected: [Substring] = ["1","2"]
        
        XCTAssertEqual(input, expected)
    }
    
    func test_요구사항1_split을_통한_분리_2() throws {
        let input = "1,".split(separator: ",")
        let expected: [Substring] = ["1"]
        
        XCTAssertEqual(input, expected)
    }
    
    func test_요구사항2_replacingOccurrences를_활용한_분리() throws {
        let input: String = "(1,2)".replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
        let expected: String = "1,2"
        
        XCTAssertEqual(input, expected)
    }

}

class SetTests: XCTestCase {
    private var numbers: Set<Int> = []
    
    override func setUpWithError() throws {
        numbers.removeAll()
        numbers.insert(1)
        numbers.insert(1)
        numbers.insert(2)
        numbers.insert(3)
    }
    
    // Test Case 구현
    func test_count_프로퍼티를_활용한_갯수_확인() {
        let input = numbers.count
        let expected = 3
        
        XCTAssertEqual(input, expected)
    }
}
