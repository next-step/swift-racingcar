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

    func test_연산자와_숫자가_모두_올바를때() {
        let sut = Calculator(for: "1 + 2 - 3 * 4 / 5")
        sut.seperateByBlankCharacter()
        
        XCTAssertEqual(sut.numbers, [1, 2, 3, 4, 5])
        XCTAssertEqual(sut.operators, ["+", "-", "*", "/"])
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
}
