//
//  Calculator.swift
//  CalcTests
//
//  Created by ycsong on 2022/04/26.
//

struct Calculator {
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func subtract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func divide(_ lhs: Int, _ rhs: Int) throws -> Int {
        if rhs < 1 {
            throw CalcError.zeroOrNagativeDivide
        }
        return lhs / rhs
    }
}
