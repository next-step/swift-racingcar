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
    }
    
    typealias ArithmeticalExpression = (Int, Int) -> Int
    
    func containsWrongArithmeticalCode(string arithmeticString: String) -> Bool {
        let wrongCodes = arithmeticString
            .components(separatedBy: " ")
            .filter{ Int($0) == nil }
            .filter { $0.isArithmeticalCode == false }
        
        return wrongCodes.isEmpty == false
    }
    
    func calculate(string arithmeticString: String?) throws -> Int? {
        guard let arithmeticString = arithmeticString else {
            throw CalculatorError.stringIsNil
        }
        
        guard arithmeticString.isEmpty == false else {
            throw CalculatorError.stringIsEmpty
        }
        
        guard containsWrongArithmeticalCode(string: arithmeticString) == false else {
            throw CalculatorError.containsWrongOperatorCode
        }
        
        var calculationResult: Int = 0
        let slicedString = arithmeticString.components(separatedBy: " ")
        
        if let firstInteger = Int(slicedString.first!) {
            calculationResult = firstInteger
        } else {
            return nil
        }
 
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

