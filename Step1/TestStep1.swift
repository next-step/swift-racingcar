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
    func test_set에_포함된_요소의_갯수_확인() {
        XCTAssertTrue(numbers.count == 3)
        XCTAssertEqual(numbers.count, 3)
        XCTAssertGreaterThan(numbers.count, 2)
    }
}
