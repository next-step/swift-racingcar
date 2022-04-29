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
}
