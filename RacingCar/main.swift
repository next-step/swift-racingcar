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
    
    func isArithmeticalCode() -> Bool {
        return ArithmeticalCode(rawValue: self) != nil ? true : false
    }
    
    func toArithmeticalCode() -> ArithmeticalCode? {
        return ArithmeticalCode(rawValue: self)
    }
}

struct StringCalculator {
    
    enum CalculatorError: Error {
        case stringIsEmptyOrNil
        case containsWrongOperatorCode
    }
    
    typealias ArithmeticalExpression = (Int, Int) -> Int
    
    func containsWrongArithmeticalCode(string arithmeticString: String) -> Bool {
        let wrongCodes = arithmeticString
            .components(separatedBy: " ")
            .filter{ Int($0) == nil }
            .filter { $0.isArithmeticalCode() == false }
        
        return wrongCodes.isEmpty == false
    }
    
    func calculate(string arithmeticString: String?) throws -> Int? {
        guard let arithmeticString = arithmeticString,
              arithmeticString.components(separatedBy: " ").isEmpty == false
        else {
            throw CalculatorError.stringIsEmptyOrNil
        }
        
        guard containsWrongArithmeticalCode(string: arithmeticString) == false else {
            throw CalculatorError.containsWrongOperatorCode
        }
        
        var result: Int = 0
        let slicedString = arithmeticString.components(separatedBy: " ")
        
        if let firstNum = Int(slicedString.first!) {
            result = firstNum
        } else {
            return nil
        }
 
        var index: Int = 1
        
        while index < slicedString.count {
            
            if let arithmeticalCode = slicedString[index].toArithmeticalCode() {
                
                let num = slicedString[index + 1]
                let arithmeticalExpression = getArithmeticalExpression(code: arithmeticalCode)
                result = arithmeticalExpression(result, Int(num)!)
            }

            index += 2
        }
        
        return result
    }
    
    private func getArithmeticalExpression(code: String.ArithmeticalCode) -> ArithmeticalExpression {

        switch code {
        case .add:
            return add(a:b:)
        case .division:
            return division(a:b:)
        case .multiply:
             return multiply(a:b:)
        case .subtract:
            return substract
        }
    }
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func division(a: Int, b: Int) -> Int {
        return a / b
    }
    
    func multiply(a: Int, b: Int) -> Int {
        return a * b
    }
    
    func substract(a: Int, b: Int) -> Int {
        return a - b
    }
}

