//
//  StringTests.swift
//  StringTests
//
//  Created by hakyung on 2022/04/26.
//

import XCTest

class StringTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSplitByComma() throws {
        let testString = "1,2"
        let seperateArr = testString.split(separator: ",")
        
        XCTAssertEqual(seperateArr, ["1","2"])
    }
    
    func testSplitEndByComma() throws {
        let testString = "1,"
        let seperateArr = testString.split(separator: ",")
        
        XCTAssert(seperateArr == ["1"])
    }
    
    func testRemoveCharacter() throws {
        let testString = "(1,2)"
        let convertedString = testString
                                .replacingOccurrences(of: "(", with: "")
                                .replacingOccurrences(of: ")", with: "")
        
        XCTAssertEqual(convertedString, "1,2")
    }

}
