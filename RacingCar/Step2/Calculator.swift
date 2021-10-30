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
    func stringCalculate(_ expression: [String]) -> Int
    func calculate(_ lhs: Int, _ operatorType: String, _ rhs: Int) -> Int
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
    
    func stringCalculate(_ expression: [String]) -> Int {
        return -1
    }
    
    func calculate(_ lhs: Int, _ operatorType: String, _ rhs: Int) -> Int {
        switch operatorType {
        case Operator.add.rawValue:
            return add(lhs, rhs)
        case Operator.subtract.rawValue:
            return subtract(lhs, rhs)
        case Operator.multiply.rawValue:
            return multiply(lhs, rhs)
        case Operator.divide.rawValue:
            return divide(lhs, rhs)
        default:
            break
        }
        // TODO: 예외처리
        return -1
    }
}
