//
//  CalcTests.swift
//  CalcTests
//
//  Created by ycsong on 2022/04/26.
//

import XCTest

class CalcTests: XCTestCase {
    
    private let calc: Calculator = Calculator()

    func testAdd() throws {
        let result = calc.add(1, 2)
        XCTAssertEqual(result, 3)
    }
    
    func testSubstract() throws {
        let result = calc.subtract(1, 1)
        XCTAssertEqual(result, 0)
    }
    
    func testMultiyply() throws {
        let result = calc.multiply(3, 10)
        XCTAssertEqual(result, 30)
    }
    
    func testDivide() throws {
        let result = try calc.divide(10, 2)
        XCTAssertEqual(result, 5)
    }
    
    func testZeroDivide() throws {
        let result = try calc.divide(10, 0)
        XCTAssertEqual(result, 0)
    }
    
    func testCheckEmpty() throws {
        if isEmpty("") {
            throw CalcError.nilOrEmpty
        }
    }
    
    func testCheckOperation() throws {
        if isInvalidOperation("(") {
            throw CalcError.invalidOperation
        }
    }
    
    func testCalculation() throws {
        let input: String = "2 + 3 * 4 / 2"
        
        if isEmpty(input) {
            throw CalcError.nilOrEmpty
        }
        
        let inputArr = input.components(separatedBy: " ")
        let result = try calcResult(inputArr)
        
        XCTAssertEqual(result, 10)
    }
}

extension CalcTests {
    func isEmpty(_ str: String?) -> Bool {
        if let str = str {
            return str.isEmpty
        }
        return true
    }
    
    func isInvalidOperation(_ operation: String?) -> Bool {
        return isEmpty(CalcOperation(rawValue: operation ?? "")?.rawValue)
    }
    
    func calculate(_ lhs: Int, _ operation: CalcOperation, _ rhs: Int) throws -> Int {
        switch operation {
        case .PLUS:
            return calc.add(lhs, rhs)
        case .MINUS:
            return calc.subtract(lhs, rhs)
        case .MULTIPLIED:
            return calc.multiply(lhs, rhs)
        case .DIVIDED:
            return try calc.divide(lhs, rhs)
        }
    }
    
    func getExpression(_ idx: Int, _ expArr: Array<String>) throws -> (operation: CalcOperation, rhs: Int) {
        if let operation = CalcOperation(rawValue: expArr[idx + 1]),
           let rhs = Int(expArr[idx + 2]) {
            return (operation, rhs)
        } else {
            throw CalcError.invalidExpression
        }
    }
    
    func calcResult(_ expArr: Array<String>) throws -> Int {
        if var result = Int(expArr[0]) {
            for i in stride(from: 0, to: expArr.count - 2, by: 2) {
                let exp = try getExpression(i, expArr)
                result = try calculate(result, exp.operation, exp.rhs)
            }
            return result
        } else {
            throw CalcError.invalidExpression
        }
    }
}
