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
        var sut = Calculator(for: "1 + 2 - 3 * 4 / 5")
        sut.seperateByBlankCharacter()
        
        XCTAssertEqual(sut.numbers, [1, 2, 3, 4, 5])
        XCTAssertEqual(sut.operators, ["+", "-", "*", "/"])
    }

}
