//
//  TestStep2.swift
//  TestStep2
//
//  Created by Dustin on 2022/04/29.
//

import XCTest

class TestStep2: XCTestCase {

    func test_더하기() {
        let step2 = Step2()
        XCTAssertEqual(step2.add(2, 3), 5)
    }
    
    func test_뺴기() {
        let step2 = Step2()
        XCTAssertEqual(step2.substract(2, 3),-1)
    }
    
    func test_나누셈() {
        let step2 = Step2()
        XCTAssertEqual(step2.divide(2, 2), 1)
    }
    
    func test_곱하기() {
        let step = Step2()
        XCTAssertEqual(step.multiply(2, 3), 6)
    }

}
