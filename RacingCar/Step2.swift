//
//  Step2.swift
//  RacingCar
//
//  Created by Dustin on 2022/04/29.
//

import Foundation


struct Step2 {
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    
    func divide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
    
    
    
    func inputCalculatorCharactor(_ lhs: Int,_ input: String,_ rhs: Int) -> Int {
        switch input {
        case "+":
            return add(lhs, rhs)
        case "-":
            return substract(lhs, rhs)
        case "*":
            return multiply(lhs, rhs)
        case "/":
            return divide(lhs, rhs)
        default:
            return 0
        }
    }
    
    func stringCalculator(_ input: String) -> Int {
        var separatedStringArray: [String] = input.components(separatedBy: " ")
        if separatedStringArray.count % 2 == 0 || separatedStringArray.isEmpty {
            return 0
        }
        var result: Int = 0
        for _ in 0..<separatedStringArray.count / 2 {
            result = inputCalculatorCharactor(Int(separatedStringArray[0]) ?? 0, separatedStringArray[1], Int(separatedStringArray[2]) ?? 0)
            separatedStringArray.removeSubrange(0...2)
            separatedStringArray.insert(String(k), at: 0)
        }
        return result
    }
    
}
