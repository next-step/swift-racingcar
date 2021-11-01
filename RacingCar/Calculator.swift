//
//  Calculator.swift
//  RacingCar
//
//  Created by sangsun on 2021/10/29.
//

import Foundation

struct Calculator {
    
    var inputs: [String]?
    
    var opCode: String?
    var previous: Int?
    var result: Int = 0
    
    /// Helper
    mutating func input() {
        inputs = readLine()?.components(separatedBy: " ")
        drive()
    }
    
    private mutating func drive() {
        guard let inputs = inputs else { return }
        
        for input in inputs {
            if let number = Int(input) {
                // 숫자이면
                if previous == nil {
                    previous = number
                } else {
                    guard let previous = previous else { return }
                    guard let opCode = opCode else { return }
                    
                    switch opCode {
                    case "+": result = add(previous, number)
                    case "-": result = substract(previous, number)
                    case "*": result = multiply(previous, number)
                    case "/": result = divide(previous, number)
                    default:
                        return
                    }
                    self.previous = result
                    self.opCode = nil
                }
            } else {
                // 숫자가 아니면
                if ["+", "-", "*", "/"].contains(input) {
                    opCode = input
                } else {
                    return
                }
            }
        }
        print(result)
    }
    
    /// Function
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func divide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
    
}
