//
//  StringCaculatorTests.swift
//  StringCaculatorTests
//
//  Created by jinho jeong on 2022/04/25.
//

import XCTest
@testable import RacingCar

class StringCaculatorTests: XCTestCase {
    
    var sut: StringCaculator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = StringCaculator()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_splitString호출시_1_2을넣었을때_1_2배열이_나오는지테스트() {
        //given
        let input = "1,2"
        
        //when
        let result = sut.splitString(to: input, separator: ",")
        
        //then
        let expectation = ["1", "2"]
        XCTAssertEqual(result, expectation)
    }
    
    func test_splitString호출시_1을넣었을때_1만포함한_배열이_나오는지테스트() {
        //given
        let input = "1"
        
        //when
        let result = sut.splitString(to: input, separator: ",")
        
        //then
        let expectation = ["1"]
        XCTAssertEqual(result, expectation)
    }
    
 
    func test_splitString괄호가있을때_괄호없애고_1_2배열_나오는지테스트() {
        //given
        let input = "(1,2)"
        
        //when
        let result = sut.splitString(to: input, separator: ",")
        
        //then
        let expectation: [String] = ["1", "2"]
        XCTAssert(result == expectation)
    }
}
