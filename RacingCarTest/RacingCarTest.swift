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
