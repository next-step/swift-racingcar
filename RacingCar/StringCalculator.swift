//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 현은백 on 2022/05/07.
//

import Foundation

class Calculate {
    class func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    class func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    class func multiply(_ lhs: Int,_ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    class func divide(_ lhs: Int,_ rhs: Int) -> Int {
        return lhs / rhs
    }
}

class StringCalculator {
    enum InputError: Error {
        case `nil`
        case emptyString
        case invalidate
        case divideToZero
    }
    
    enum 기호: String {
        case add = "+"
        case substract = "-"
        case multiply = "*"
        case divide = "/"
        
        func calculate(_ lhs: Int, _ rhs: Int) -> Int {
            switch self {
            case .add:
                return Calculate.add(lhs, rhs)
            case .substract:
                return Calculate.substract(lhs, rhs)
            case .multiply:
                return Calculate.multiply(lhs, rhs)
            case .divide:
                return Calculate.divide(lhs, rhs)
            }
        }
    }
    
    
    let string: String
    let calculator = Calculator()
    
    init(_ input: String?) throws {
        guard let string = input else {
            throw InputError.nil
        }
        
        guard string != "" else {
            throw InputError.emptyString
        }
        
        self.string = string
    }
    
    func calculate() throws -> Int {
        let 식 = string.components(separatedBy: " ")
        guard 식.count >= 3 else {
            throw InputError.invalidate
        }
        
        let numbers = 식.compactMap { Int($0) }
        
        let 기호s = 식.filter{
            return $0 == "+" || $0 == "-" || $0 == "*" || $0 == "/"
        }.compactMap{ 기호(rawValue: String($0)) }

        guard numbers.count - 1 == 기호s.count else {
            throw InputError.invalidate
        }
        
        var result = numbers[0]

        try 기호s.enumerated().forEach{ index, 기호 in
            if 기호 == .divide && numbers[index + 1] == 0 {
                throw InputError.divideToZero
            }
            result = 기호.calculate(result, numbers[index + 1])
        }
        
        return result
    }
    
}
