//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 현은백 on 2022/05/07.
//

import Foundation

class StringCalculator {
    enum InputError: Error {
        case nilInput
        case emptyString
        case invalidate
        case divideToZero
    }
    
    enum Symbol: String {
        case add = "+"
        case substract = "-"
        case multiply = "*"
        case divide = "/"
        
        func calculate(_ lhs: Int, _ rhs: Int) -> Int {
            let calculator = Calculator()
            switch self {
            case .add:
                return calculator.add(lhs, rhs)
            case .substract:
                return calculator.substract(lhs, rhs)
            case .multiply:
                return calculator.multiply(lhs, rhs)
            case .divide:
                return calculator.divide(lhs, rhs)
            }
        }
    }
    
    let string: String
    
    init(_ input: String?) throws {
        guard let string = input else {
            throw InputError.nilInput
        }
        
        guard string != "" else {
            throw InputError.emptyString
        }
        
        self.string = string
    }
    
    func calculate() throws -> Int {
        let fomula = string.components(separatedBy: " ")
        guard fomula.count >= 1 else {
            throw InputError.invalidate
        }
        
        let numbers = fomula.compactMap { Int($0) }
        
        let symbols = fomula.compactMap{ Symbol(rawValue: $0) }

        guard numbers.count - 1 == symbols.count else {
            throw InputError.invalidate
        }
        
        var result = numbers[0]

        try symbols.enumerated().forEach{ index, symbol in
            if symbol == .divide && numbers[index + 1] == 0 {
                throw InputError.divideToZero
            }
            result = symbol.calculate(result, numbers[index + 1])
        }
        
        return result
    }
    
}
