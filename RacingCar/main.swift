//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

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
    
    typealias ArithmeticalExpression = (Int, Int) -> Int
    
    func containsWrongArithmeticalCode(string arithmeticString: String) -> Bool {
        let wrongCodes = arithmeticString
            .components(separatedBy: " ")
            .filter{ Int($0) == nil }
            .filter { $0.isArithmeticalCode() == false }
        
        return wrongCodes.isEmpty == false
    }
    
    func calculate(string arithmeticString: String?) -> Int? {
        guard let arithmeticString = arithmeticString else {
            return nil
        }
        
        guard arithmeticString.components(separatedBy: " ").isEmpty == false else {
            return nil
        }
        
        guard containsWrongArithmeticalCode(string: arithmeticString) == false else {
            return nil
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
