//
//  Step1.swift
//  Step1
//
//  Created by Dustin on 2022/04/25.
//

import XCTest



class TestStep1: XCTestCase {
    
    func test_12을_콤마로_split_했을_때_1과_2로_잘_분리되는지() {
        let step1 = Step1()
        XCTAssertEqual(step1.splitByComma("1,2"), ["1","2"])
        
        
    }
    
    func test_1을_콤마로_split_했을_때_1만_포함하는_Array가_반환되는지 ()
    {
        let step1 = Step1()
        XCTAssertEqual(step1.splitByComma("1"), ["1"])
        
    }
    
    func test_replacingOccurrences_메소드를_활용해_괄호을_제거 () {
        let step1 = Step1()
        XCTAssertEqual(step1.replacingBracket("(1,2)"), "1,2")
    }
    
    
    
}
