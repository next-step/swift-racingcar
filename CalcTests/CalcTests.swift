//
//  CalcTests.swift
//  CalcTests
//
//  Created by ycsong on 2022/04/26.
//

import XCTest

class CalcTests: XCTestCase {
    
    private let calc: Calculator = Calculator()

    func testAdd() throws {
        let result = calc.add(1, 2)
        XCTAssertEqual(result, 3)
    }
    
    func testSubstract() throws {
        let result = calc.subtract(1, 1)
        XCTAssertEqual(result, 0)
    }
    
    func testMultiyply() throws {
        let result = calc.multiply(3, 10)
        XCTAssertEqual(result, 30)
    }
    
    func testDivide() throws {
        let result = try calc.divide(10, 2)
        XCTAssertEqual(result, 5)
    }
    
    func testZeroDivide() throws {
        let result = try calc.divide(10, 0)
        XCTAssertEqual(result, 0)
    }
    
}
