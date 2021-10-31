//
//  StringCalculatorTest.swift
//  StringCalculatorTest
//
//  Created by 남기범 on 2021/10/29.
//

import XCTest
@testable import StringCalculator

class StringCalculatorTest: XCTestCase {
    var calculator: StubCalculator!
    
    override func setUpWithError() throws {
        calculator = StubCalculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }
}

// MARK: - 사칙연산 테스트

extension StringCalculatorTest {
    func test_add() {
        calculator.register(Int.self, name: "add", provider: {
            return 3 + 5
        })
        
        XCTAssertEqual(8, calculator.add(3, 5))
    }
    
    func test_substract() {
        calculator.register(Int.self, name: "substract", provider: {
            return 3 - 5
        })
        
        XCTAssertEqual(-2, calculator.substract(3, -5))
    }
    
    func test_divide() {
        calculator.register(Int.self, name: "divide", provider: {
            return 6 / 3
        })
        
        XCTAssertEqual(2, calculator.divide(6, 3))
    }
    
    func test_multiply() {
        calculator.register(Int.self, name: "multiply", provider: {
            return 2 * 5
        })
        
        XCTAssertEqual(10, calculator.multiply(2, 5))
    }
}


// MARK: - String 값 분해 및 계산 테스트

extension StringCalculatorTest {
    func test_calculate_with_operation_enum_add() {
        calculator.register(Int.self, name: "calculate", provider: {
            return 1 + 1
        })
        
        XCTAssertEqual(2, calculator.calculate(1, 1, operation: .add))
    }
    
    func test_calculate_with_operation_enum_substract() {
        calculator.register(Int.self, name: "calculate", provider: {
            return 1 - 1
        })
        
        XCTAssertEqual(0, calculator.calculate(1, 1, operation: .substract))
    }
}
