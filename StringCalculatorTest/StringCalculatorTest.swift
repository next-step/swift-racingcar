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
    
    func test_calculate_with_operation_enum_divide() {
        calculator.register(Int.self, name: "calculate", provider: {
            return 1 / 1
        })
        
        XCTAssertEqual(1, calculator.calculate(1, 1, operation: .divide))
    }
    
    func test_calculate_with_operation_enum_multiply() {
        calculator.register(Int.self, name: "calculate", provider: {
            return 1 * 1
        })
        
        XCTAssertEqual(1, calculator.calculate(1, 1, operation: .multiply))
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
