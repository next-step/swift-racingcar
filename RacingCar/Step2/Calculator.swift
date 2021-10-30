//
//  Calculator.swift
//  RacingCar
//
//  Created by 조민호 on 2021/10/30.
//

import Foundation

protocol Calculation {
    func add(_ lhs: Int, _ rhs: Int) -> Int
    func subtract(_ lhs: Int, _ rhs: Int) -> Int
    func multiply(_ lhs: Int, _ rhs: Int) -> Int
    func divide(_ lhs: Int, _ rhs: Int) -> Int
    func calculate(_ expression: [String]) -> Int
}

struct Calculator: Calculation {
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func subtract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func divide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
    
    func calculate(_ expression: [String]) -> Int {
        return -1
    }
    
}
