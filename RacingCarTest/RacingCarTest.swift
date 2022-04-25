//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 카카오VX on 2022/04/25.
//

import XCTest

class RacingCarTest: XCTestCase {
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testPerformanceExample() throws {
        measure {
        }
    }
    
    func testSplitString() {
        let splitedArray = splitString("1,2")
        
        XCTAssertEqual(splitedArray[0], "1")
        XCTAssertEqual(splitedArray[1], "2")
    }
    
    func testSplitWithoutSeparator() {
        let splitedArray = splitString("1")
        
        XCTAssertEqual(splitedArray[0], "1")
    }
}

private extension RacingCarTest {
    func splitString(_ target: String) -> [String] {
        let stringWithBracketRemoved = target.replacingOccurrences(of: "()", with: "")
        return stringWithBracketRemoved.components(separatedBy: ",")
    }
}
