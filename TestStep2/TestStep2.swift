//
//  TestStep2.swift
//  TestStep2
//
//  Created by Dustin on 2022/04/29.
//

import XCTest

class TestStep2: XCTestCase {
    
    var step2 = Step2()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        step2 = Step2()
    }

    func test_더하기() {
        XCTAssertEqual(step2.add(2, 3), 5)
    }
    
    func test_뺴기() {
        XCTAssertEqual(step2.substract(2, 3),-1)
    }
    
    func test_나누셈() {
        XCTAssertEqual(step2.divide(2, 2), 1)
    }
    
    func test_곱하기() {
        XCTAssertEqual(step2.multiply(2, 3), 6)
    }
    
    
    func test_세개_인_풋_넣어서_연산하기() {
        XCTAssertEqual(step2.inputCalculatorCharactor(3, "*", 2), 6)
    }
    
    func test_이_플러스_삼_곱하기_사_더하기_오_나누기_이() {
        XCTAssertTrue(step2.stringCalculator(["2","+","3","*","4","+","5","/","2"]) == 12)
    }
}
