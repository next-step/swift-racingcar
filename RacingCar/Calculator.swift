//
//  Calculator.swift
//  RacingCar
//
//  Created by sangsun on 2021/10/29.
//

import Foundation

struct Calculator {
    
    func input() {
        let inputs = readLine()?.components(separatedBy: " ")
    }
    
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
