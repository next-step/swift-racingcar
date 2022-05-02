//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

extension String {
    
    private enum ArithmeticalCode: String {
        case add = "+"
        case division = "/"
        case multiply = "*"
        case subtract = "-"
    }
    
    func isArithmeticalCode() -> Bool {
        return ArithmeticalCode(rawValue: self) != nil ? true : false
    }
}

struct StringCalculator {
    
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
        
        guard containsWrongArithmeticalCode(string: arithmeticString) == false else {
            return nil
        }
        
        return 0
    }
    
    func 더하다(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func 나누다(a: Int, b: Int) -> Int {
        return a / b
    }
    
    func 곱하다(a: Int, b: Int) -> Int {
        return a * b
    }
    
    func 빼다(a: Int, b: Int) -> Int {
        return a - b
    }
}
