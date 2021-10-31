//
//  CalculatorTest.swift
//  RacingCarTest
//
//  Created by 조민호 on 2021/10/31.
//

import XCTest

class CalculatorTest: XCTestCase {

    let calculator = Calculator()
    
    func test_덧셈() throws {
        let result = calculator.add(5, 5)
        let expect = 10
        
        XCTAssertEqual(result, expect)
    }

    func test_뺄셈() throws {
        let result = calculator.subtract(5, 5)
        let expect = 0
        
        XCTAssertEqual(result, expect)
    }
    
    func test_곱셈() throws {
        let result = calculator.multiply(5, 5)
        let expect = 25
        
        XCTAssertEqual(result, expect)
    }
    
    func test_나눗셈() throws {
        let result = calculator.divide(5, 5)
        let expect = 1
        
        XCTAssertEqual(result, expect)
    }

}
