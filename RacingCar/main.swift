//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

struct StringCalculator {
    
    enum ArithmeticalError: Error {
        case ArithmeticalStringIsNil
        case ArithmeticalStringIsEmpty
    }
    
    enum ArithmeticalCode: String {
        case 더하다 = "+"
        case 나누다 = "/"
        case 곱하다 = "*"
        case 빼다 = "-"
    }
    
    func 연산하기(string: String?) -> Int? {
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
