//
//  StringCalculator.swift
//  RacingCarTests
//
//  Created by swave on 2022/04/30.
//

import XCTest
//@testable import RacingCar

//MARK: 2단계 문자열 계산기

class StringCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_calculateString_2더하기3곱하기4나누기2는10() throws {
        
        let request: String = "2 + 3 * 4 / 2"
        
        let stringCalculator: StringCalculator = StringCalculator()
        let result: Int = try stringCalculator.calculate(string: request)
        print("result \(result)")
        XCTAssertEqual(result, 10)
    }
    
    func test_calculateString_2더하기3은5() throws {
        
        let request: String = "2 + 3"
        
        let stringCalculator: StringCalculator = StringCalculator()
        let result: Int = try stringCalculator.calculate(string: request)
        print("result \(result)")
        XCTAssertEqual(result, 5)
    }
    
    func test_calculateString_1부터10까지더하면55() throws {
        
        let request: String = "1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10"
        
        let stringCalculator: StringCalculator = StringCalculator()
        let result: Int = try stringCalculator.calculate(string: request)
        print("result \(result)")
        XCTAssertEqual(result, 55)
    }
}
