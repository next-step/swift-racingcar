//
//  StringCalculatorTest.swift
//  RacingTest
//
//  Created by 임현규 on 2021/10/29.
//

import XCTest
@testable import RacingCar

class StringCalculatorTest: XCTestCase {
    let cal = StringCalculator()

    func test_isHasOperator() {
        XCTAssertEqual(cal.isHasValidationOperator(data: ["1", "3", "4", "5"]), false)
        XCTAssertEqual(cal.isHasValidationOperator(data: ["1", "+", "4"]), true)
        XCTAssertEqual(cal.isHasValidationOperator(data: ["1", "5", "2", "1"]), false)
    }
    
    func test_isDataIntAbleString() {
        XCTAssertEqual(cal.isHasIntAbleString(data: ["1", "3", "4", "5"]), true)
        XCTAssertEqual(cal.isHasIntAbleString(data: ["1", "a", "4"]), true)
        XCTAssertEqual(cal.isHasIntAbleString(data: ["1", "5", "2", "1"]), true)
    }
    
    func test_Add() {
        XCTAssertEqual(cal.add(9, 10), 19)
        XCTAssertEqual(cal.add(9, 7), 16)
        XCTAssertEqual(cal.add(5, 50), 55)
    }
    
    func test_Minus() {
        XCTAssertEqual(cal.minus(100, 10), 90)
        XCTAssertEqual(cal.minus(50, 10), 40)
        XCTAssertEqual(cal.minus(5, 10), -5)
    }
    
    func test_Multiple() {
        XCTAssertEqual(cal.multiple(9, 10), 90)
        XCTAssertEqual(cal.multiple(9, 7), 63)
        XCTAssertEqual(cal.multiple(5, 50), 250)
    }
    
    func test_Divide() {
        XCTAssertEqual(cal.divide(10, 10), 1)
        XCTAssertEqual(cal.divide(10, 2), 5)
        XCTAssertEqual(cal.divide(5, 5), 1)
    }
}
