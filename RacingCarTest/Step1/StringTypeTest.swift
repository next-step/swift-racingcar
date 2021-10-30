//
//  StringTypeTest.swift
//  RacingCarTest
//
//  Created by 조민호 on 2021/10/26.
//

import XCTest

class StringTypeTest: XCTestCase {
    
    let stringType: StringType = StringType()

    // MARK: 요구사항 1
    func test_문자를_콤마로_스플릿했을때_잘분리되는지() throws {
        let testResultValue = stringType.firstStringTypeCase("1,2")
        let testExpectValue: [String.SubSequence] = ["1", "2"]
        
        XCTAssertEqual(testResultValue, testExpectValue)
        XCTAssert(testResultValue == testExpectValue)
        
    }
    
    func test_문자한개를_콤마로_스플릿했을때_한개만_포함하는배열이_반환되는지() throws {
        let testResultValue = stringType.firstStringTypeCase("1")
        let testExpectValue: [String.SubSequence] = ["1"]
        
        XCTAssertEqual(testResultValue, testExpectValue)
        XCTAssert(testResultValue == testExpectValue)
    }
    
    // MARK: 요구사항 2
    func test_문자중_괄호가_제거되는지() throws {
        let testResultValue = stringType.secondStringTypeCase("(1,2)")
        let testExpectValue = "1,2"
        
        XCTAssertEqual(testResultValue, testExpectValue)
    }

}
