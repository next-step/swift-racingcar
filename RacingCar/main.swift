//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

final class StringControl {
    static func split(string: String, separator: Character) -> [String] {
        return string.split(separator: separator).map { String($0) }
    }
        
    static func removeParentheses(_ string: String) -> String {
        return string.replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
    }
}

extension String {
    
    enum ArithmeticalCode: String {
        case add = "+"
        case division = "/"
        case multiply = "*"
        case subtract = "-"
    }
    var isArithmeticalCode: Bool {
        return ArithmeticalCode(rawValue: self) != nil ? true : false
    }
    
    var toArithmeticalCode: ArithmeticalCode? {
        return ArithmeticalCode(rawValue: self)
    }
}

struct StringCalculator {
    
    enum CalculatorError: Error {
        case stringIsNil
        case stringIsEmpty
        case containsWrongOperatorCode
        case impossibleCalculateExpression
    }
    
    typealias ArithmeticalExpression = (Int, Int) -> Int
    
    func containsWrongArithmeticalCode(string arithmeticString: String) -> Bool {
        let wrongCodes = arithmeticString
            .components(separatedBy: " ")
            .filter{ Int($0) == nil }
            .filter { $0.isArithmeticalCode == false }
        
        return wrongCodes.isEmpty == false
    }
    
    func calculate(expressionString: String?) throws -> Int {
        try isValid(expression: expressionString)
        let slicedString = expressionString!.components(separatedBy: " ")
        
        var calculationResult: Int = Int(slicedString.first!)!
        var slicedArrHead: Int = 1
        
        while slicedArrHead < slicedString.count {
            
            if let arithmeticalCode = slicedString[slicedArrHead].toArithmeticalCode {
                
                let valueToCalculate = slicedString[slicedArrHead + 1]
                let arithmeticalExpression = arithmeticalExpression(code: arithmeticalCode)
                calculationResult = arithmeticalExpression(calculationResult, Int(valueToCalculate)!)
            }

            slicedArrHead += 2
        }
        
        return calculationResult
    }
    
    @discardableResult
    private func isValid(expression: String?) throws -> Bool {
        guard let expression = expression else {
            throw CalculatorError.stringIsNil
        }
        
        guard expression.isEmpty == false else {
            throw CalculatorError.stringIsEmpty
        }
        
        guard containsWrongArithmeticalCode(string: expression) == false else {
            throw CalculatorError.containsWrongOperatorCode
        }
                
        guard let firstInteger = expression.components(separatedBy: " ").first,
              let _ = Int(firstInteger) else {
            throw CalculatorError.impossibleCalculateExpression
        }
        
        return true
    }
    
    private func arithmeticalExpression(code: String.ArithmeticalCode) -> ArithmeticalExpression {

        switch code {
        case .add:
            return add(lhs:rhs:)
        case .division:
            return division(lhs:rhs:)
        case .multiply:
             return multiply(lhs:rhs:)
        case .subtract:
            return substract(lhs:rhs:)
        }
    }
    
    func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func division(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
    
    func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func substract(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
}

