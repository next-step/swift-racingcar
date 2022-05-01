//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by 이우섭 on 2022/04/27.
//

import XCTest

class CalculatorTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_1_과_2를_덧셈() {
        let sut = Calculator(for: "1 + 2")
        XCTAssertEqual(try sut.calculate(), 3)
    }
    
    func test_1_과_2를_뺄셈() {
        let sut = Calculator(for: "1 - 2")
        XCTAssertEqual(try sut.calculate(), -1)
    }
    
    func test_2_와_3을_곱셈() {
        let sut = Calculator(for: "2 * 3")
        XCTAssertEqual(try sut.calculate(), 6)
    }

    func test_6_과_2를_나눗셈() {
        let sut = Calculator(for: "6 / 2")
        XCTAssertEqual(try sut.calculate(), 3)
    }
    
    func test_나머지가_생기는_나눗셈() {
        let sut = Calculator(for: "5 / 2")
        XCTAssertEqual(try sut.calculate(), 2)
    }
    
    func test_사칙연산이_모두_존재하는_수식() {
        let sut = Calculator(for: "2 + 3 * 4 / 2")
        XCTAssertEqual(try sut.calculate(), 10)
    }
    
    func test_올바르지_못한_연산자가_존재하는_수식() {
        let sut = Calculator(for: "1 @ 2")
        XCTAssertThrowsError(try sut.calculate())
    }
    
    func test_연산자가_없는_수식() {
        let sut = Calculator(for: "1 2")
        XCTAssertThrowsError(try sut.calculate())
    }
    
    func test_숫자가_하나_부족한_수식() {
        let sut = Calculator(for: "1 + ")
        XCTAssertThrowsError(try sut.calculate())
    }
    
    func test_연산자만_존재하는_수식() {
        let sut = Calculator(for: " + - ")
        XCTAssertThrowsError(try sut.calculate())
    }
    
    func test_빈_문자열이_주어진_수식() {
        let sut = Calculator(for: "")
        XCTAssertThrowsError(try sut.calculate())
    }
    
    func test_빈_공백_문자열이_주어진_수식() {
        let sut = Calculator(for: " ")
        XCTAssertThrowsError(try sut.calculate())
    }
}
