//
//  StringCaculator.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/25.
//

import Foundation


final class StringCaculator {
    
     enum StringCaculatorErrorType: Error {
        case inputEmptyError
        case divideByZero
        case notComputationOperator
        case notComputationOperand
        case incorrectExpression
    }
    
    private enum OperatorType: String {
        case plus = "+"
        case minus = "-"
        case multiply = "*"
        case divide = "/"
    }
    
    func caculate(expression: String) throws -> Int {
        let removedSpaceExpression: [String] = removeSpaceCharacter(input: expression) // " "제거
        var validationString = try validateEmptyCheckFor(expression: removedSpaceExpression) // nil값 체크
        try checkIncorrectExpression(input: expression) // 올바른 표현식인지 체크
        
        //처음 값을 current에 저장
        var current: Int = 0
        current = try getOperand(operand: validationString.removeFirst())
        
        // 순회하여 각 lhs(current) - operator - rhs 계산하여 current에 계속해서 저장
        while(!validationString.isEmpty) {
            let lhs: Int = current
            let `operator`: OperatorType = try getOperator(operator: validationString.removeFirst())
            let rhs: Int = try getOperand(operand: validationString.removeFirst())
            current = try caculate(lhs: lhs, operator: `operator`, rhs: rhs)
        }
        return current
    }
    
    // 입력값 nil 체크
    private func validateEmptyCheckFor(expression: [String])  throws -> [String] {
        guard !expression.isEmpty else {
            throw StringCaculatorErrorType.inputEmptyError
        }
        return expression
    }
    
    // 올바른 표현식인지 체크
    private func checkIncorrectExpression(input: String) throws {
        guard let first = input.first, let last = input.last  else { return }
        
        if isOperand(input: String(first)) == false ||
            isOperand(input: String(last)) == false
        {
            throw StringCaculatorErrorType.incorrectExpression
        }
    }
    
    // 0으로 나누는 경우 체크
    private func checkDivideOperandZero(operand: Int) throws {
        if operand == 0 {
            throw StringCaculatorErrorType.divideByZero
        }
    }
    
    // 공백문자제거
    private func removeSpaceCharacter(input: String) -> [String] {
        return input.components(separatedBy: " ").filter {$0 != ""}
    }
    
    // 들어온 문자를 연산자로 변환
    private func getOperator(operator: String) throws -> OperatorType {
        guard let `operator` = OperatorType(rawValue: `operator`)  else {
            throw StringCaculatorErrorType.notComputationOperator
        }
        return `operator`
    }
    
    // 들어온 문자를 피연산자로 변환
    private func getOperand(operand: String) throws -> Int {
        guard let operand = Int(operand)  else {
            throw StringCaculatorErrorType.notComputationOperand
        }
        return operand
    }
    
    //들어온 문자가 피연산자로 변환가능 여부를 반환
    private func isOperand(input: String) -> Bool {
        return (Int(input) != nil)
    }
    
    // 사친연산
    private func caculate(lhs: Int, operator: OperatorType, rhs: Int) throws -> Int {
        switch `operator` {
        case .plus:
            return plus(lhs: lhs, rhs: rhs)
        case .minus:
            return minus(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        case .divide:
            try checkDivideOperandZero(operand: rhs)
            return divide(lhs: lhs, rhs: rhs)
        }
    }
    
    // 덧셈
    private func plus(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    // 뺄셈
    private func minus(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    // 곱셈
    private func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
    // 나눗셈
    private  func divide(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
}
