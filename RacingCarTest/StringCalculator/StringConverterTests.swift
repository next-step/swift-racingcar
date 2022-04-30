//
//  StringConverterTests.swift
//  RacingCarTest
//
//  Created by 강수진 on 2022/04/27.
//

import XCTest

class StringConverterTests: XCTestCase {

    var sut: StringConverter!
    
    override func setUpWithError() throws {
        sut = StringConverter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_numberStringIsGiven_returnInInt() throws {
        // given
        let input = "1"
        
        // when
        let result = try sut.convertToInt(from: input)
        
        // then
        let expectation = 1
        XCTAssertEqual(result, expectation)
    }
    
    
    func test_notNumberStringIsGiven_throwConvertToIntFail() throws {
        // given
        let input = "+"

        // when
        // then
        let expectation = StringConverter.StringConverterError.convertToIntFail
        XCTAssertThrowsError(try sut.convertToInt(from: input)) { error in
            XCTAssertEqual(error as! StringConverter.StringConverterError, expectation)
        }
    }
}
