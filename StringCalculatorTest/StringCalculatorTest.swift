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
    func test_call_private_calculate_function_with_operation() {
        let expect = expectation(description: "String 값에서 사칙연산 기호로 Operation Enum 생성 후, private calculate function 호출")
        expect.expectedFulfillmentCount = 4
        let inputString = "1 + 2 - 3 / 4 * 5"
        
        calculator.called(name: "calculateWithOperation", verify: { string in
            guard let string = string as? String else { return }
            let mathematicalExpression = string.components(separatedBy: " ")
            let operators = mathematicalExpression.filter { Int($0) == nil }
            
            for index in 0..<operators.count {
                guard let _ = Operation(rawValue: operators[index]) else {
                    return
                }
                
                expect.fulfill()
            }
        })
        
        let _ = try? calculator.calculate(with: inputString)
        wait(for: [expect], timeout: 0.1)
    }
    
    func test_calculate_with_string_ignore_opration_priority() {
        calculator.registerThrows(Int.self, name: "calculateWithString", provider: {
            var resultValue = 1
            resultValue += 1
            resultValue *= 5
            resultValue -= 2
            resultValue /= 2
            return resultValue
        })
        
        XCTAssertEqual(4, try? calculator.calculate(with: "1 + 1 * 5 - 2 / 2"))
    }
}

// MARK: - 계산기 예외상황 테스트

extension StringCalculatorTest {
    func test_calculate_with_string_when_blank() {
        let inputString: String? = "    "
        
        calculator.registerThrows(Int.self, name: "calculateWithString", provider: {
            guard let inputString = inputString,
                  !inputString.filter({ !$0.isNewline && !$0.isWhitespace }).isEmpty
            else {
                throw CalculationError.inputNilOrEmpty
            }
            return 0
        })
        
        do {
            _ = try calculator.calculate(with: inputString)
        } catch {
            let calculationError = error as? CalculationError
            XCTAssertEqual(CalculationError.inputNilOrEmpty, calculationError)
        }
    }
    
    func test_calculate_with_string_when_nil() {
        let inputString: String? = nil
        
        calculator.registerThrows(Int.self, name: "calculateWithString", provider: {
            guard let _ = inputString else {
                throw CalculationError.inputNilOrEmpty
            }
            return 0
        })
        
        do {
            _ = try calculator.calculate(with: inputString)
        } catch {
            let calculationError = error as? CalculationError
            XCTAssertEqual(CalculationError.inputNilOrEmpty, calculationError)
        }
    }
    
    func test_calculate_with_string_not_arithmetic_operation() {
        let inputString = "+-/*%#@!$#%#$@"
        
        calculator.registerThrows(Int?.self, name: "calculateWithString", provider: {
            let components = inputString.map { String($0) }
            
            for component in components {
                guard let _ = Operation(rawValue: component) else {
                    throw CalculationError.notArithmeticOperation
                }
            }
            
            return 0
        })
        
        do {
            _ = try calculator.calculate(with: inputString)
        } catch {
            let calculationError = error as? CalculationError
            XCTAssertEqual(CalculationError.notArithmeticOperation, calculationError)
        }
    }
}
