//
//  StringCalculateTest.swift
//  StringCalculateTest
//
//  Created by 현은백 on 2022/05/07.
//

import XCTest
@testable import RacingCar

class StringCalculateTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testValidInput() throws {
        let calculator = try StringCalculator("2 + 3 * 4 / 2")
        let result = try calculator.calculate()
        XCTAssertEqual(result, 10)
    }
    
    func testInvalidInput1() throws {
        let calculator = try StringCalculator("6 / 3 + 2  * 5 - 1")
        let result = try calculator.calculate()
        XCTAssertNotEqual(result, 1)
    }
    
    func testInvalidInput2() throws {
        let calculator = try StringCalculator("1 + ")
        XCTAssertThrowsError(try calculator.calculate())
    }
    
    func testDividedByZero() throws {
        let calculator = try StringCalculator("1 + 2 / 0 * 4")
        XCTAssertThrowsError(try calculator.calculate())
    }

}
