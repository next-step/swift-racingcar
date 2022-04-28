//
//  StringCaculator.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/25.
//

import Foundation


final class StringCaculator {
    
     enum StringCaculatorError: Error {
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
       
        var validationString = try validate(expression: expression)
        
        var current: Int = 0
        current = try getOperand(operand: validationString.removeFirst())
        
        while(!validationString.isEmpty) {
            let lhs: Int = current
            let `operator`: OperatorType = try getOperator(operator: validationString.removeFirst())
            let rhs: Int = try getOperand(operand: validationString.removeFirst())
            current = try caculate(lhs: lhs, operator: `operator`, rhs: rhs)
        }
        return current
    }
    
    private func validate(expression: String) throws -> [String] {
        let removedSpaceExpression: [String] = removeSpaceCharacter(input: expression)
        let validationString = try validateEmptyCheck(expression: removedSpaceExpression)
        try checkIncorrectExpression(input: expression)
        return validationString
    }
   
    private func validateEmptyCheck(expression: [String])  throws -> [String] {
        guard !expression.isEmpty else {
            throw StringCaculatorError.inputEmptyError
        }
        return expression
    }
    
   
    private func checkIncorrectExpression(input: String) throws {
        guard let first = input.first, let last = input.last  else { return }
        
        if isOperand(input: String(first)) == false ||
            isOperand(input: String(last)) == false
        {
            throw StringCaculatorError.incorrectExpression
        }
    }
    

    private func checkDivideOperandZero(operand: Int) throws {
        if operand == 0 {
            throw StringCaculatorError.divideByZero
        }
    }
    
    
    private func removeSpaceCharacter(input: String) -> [String] {
        return input.components(separatedBy: " ").filter {$0 != ""}
    }
    
    
    private func getOperator(operator: String) throws -> OperatorType {
        guard let `operator` = OperatorType(rawValue: `operator`)  else {
            throw StringCaculatorError.notComputationOperator
        }
        return `operator`
    }
    
  
    private func getOperand(operand: String) throws -> Int {
        guard let operand = Int(operand)  else {
            throw StringCaculatorError.notComputationOperand
        }
        return operand
    }
    
    private func isOperand(input: String) -> Bool {
        return (Int(input) != nil)
    }
    
    
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
    
    private func plus(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    
    private func minus(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    
    private func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
   
    private  func divide(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
}
