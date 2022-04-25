//
//  SetTests.swift
//  StringCaculatorTests
//
//  Created by jinho jeong on 2022/04/25.
//

import XCTest

class SetTests: XCTestCase {
    
    private var numbers: Set<Int> = []
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        numbers.removeAll()
                numbers.insert(1)
                numbers.insert(1)
                numbers.insert(2)
                numbers.insert(3)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        numbers.removeAll()
    }

   
    func test_numberCount갯수가_중복숫자가_들어갔을때_정확한지_체크() {
        //given
        let numbersCount = 3
        
        //when
        numbers.insert(3)
        
        //then
        XCTAssertEqual(numbers.count, numbersCount)
  
    }
    
    func test_numberCount갯수가_새로운숫자가_들어갔을때_정확한지_체크() {
        //given
        let numbersCount = 4
        
        //when
        numbers.insert(4)
        
        //then
        XCTAssertEqual(numbers.count, numbersCount)
  
    }
}
