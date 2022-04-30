//
//  Calculator.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/28.
//

import Foundation

protocol Operation {
    func operate(_ lhs: Int, _ rhs: Int) throws -> Int
}

struct Plus: Operation {
    func operate(_ lhs: Int, _ rhs: Int) throws -> Int {
        return lhs + rhs
    }
}

struct Minus: Operation {
    func operate(_ lhs: Int, _ rhs: Int) throws -> Int {
        return lhs - rhs
    }
}

struct Division: Operation {
    enum DivisionError: String, Error {
        case divideByZero = "0으로 나눌 수 없습니다."
    }
    
    func operate(_ lhs: Int, _ rhs: Int) throws -> Int  {
        if rhs == 0 {
            throw DivisionError.divideByZero
        }
        
        return lhs / rhs
    }
}

struct Multiplication: Operation {
    func operate(_ lhs: Int, _ rhs: Int) throws -> Int {
        return lhs * rhs
    }
}
