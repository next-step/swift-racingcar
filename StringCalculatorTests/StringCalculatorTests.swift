//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by 김성준 on 2022/05/01.
//

import XCTest
@testable import StringCalculator

class StringCalculatorTests: XCTestCase {

    private let calculator = StringCalculator()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_두_정수의_덧셈이_잘_동작하는지() {
        let a = 1
        let b = 4
        
        let result = calculator.더하다(a: a, b: b)
        XCTAssertEqual(result, a + b)
    }
    
    func test_두_정수의_뺄셈이_잘_동작하는지() {
        let a = 3
        let b = 2
        
        let result = calculator.빼다(a: a, b: b)
        XCTAssertEqual(result, a - b)
    }
    
    func test_두_정수의_나눗셈이_잘_동작하는지() {
        let a = 3
        let b = 3
        
        let result = calculator.나누다(a: a, b: b)
        XCTAssertEqual(result, a / b)
    }
    
    func test_두_정수의_곱셈이_잘_동작하는지() {
        let a = 3
        let b = 3
        
        let result = calculator.곱하다(a: a, b: b)
        XCTAssertEqual(result, a * b)
    }
   
}
