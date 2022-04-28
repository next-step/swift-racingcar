//
//  StringCaculator.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/25.
//

import Foundation


class StringCaculator {
    
    enum StringCaculatorErorType: Error {
        case inputError
        case divideByZero
        case notComputationSymbol
    }
    
    enum OperatorType: String {
        case plus = "+"
        case minus = "-"
        case multiply = "*"
        case divide = "/"
    }
    
    // 덧셈
    func plus(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    // 뺄셈
    func minus(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    // 곱셈
    func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
    // 나눗셈
    func divide(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
    
    // 입력값 nil 체크
    func validateNilCheckFor(input: String)  throws -> String {
        guard !input.isEmpty else {
            throw StringCaculatorErorType.inputError
        }
        return input
    }
    
    
    // 사친연산
    func caculate(lhs: Int, rhs: Int, operator: OperatorType) throws -> Int {
        switch `operator` {
        case .plus:
           return plus(lhs: lhs, rhs: rhs)
        case .minus:
            return minus(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        case .divide:
            try divideOperandZero(operand: rhs)
            return divide(lhs: lhs, rhs: rhs)
        }
    }
    
    //0으로 나누는 경우 체크
    func divideOperandZero(operand: Int) throws {
        if operand == 0 {
            throw StringCaculatorErorType.divideByZero
        }
    }
    
    // 공백문자제거
    func removeSpacingCharacter(input: String) -> [String] {
        return input.components(separatedBy: " ")
    }
    
    //들어온 문자가 연산자인지 체크
    func isOperator(operand: String) throws -> Bool {
        guard (OperatorType(rawValue: operand) != nil) else {
            throw StringCaculatorErorType.notComputationSymbol
        }
        return true
    }
    
    //들어온 문자가 피연산자인지 체크
    func isOperand(input: String) -> Bool {
        return (Int(input) != nil)
    }
}



