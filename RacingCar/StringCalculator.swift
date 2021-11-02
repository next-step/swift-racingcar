//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 김효성 on 2021/10/28.
//

protocol ArithmeticProtocol {
    func add(_ lhs: Int, _ rhs: Int) -> Int
    func substract(_ lhs: Int, _ rhs: Int) -> Int
    func multiply(_ lhs: Int, _ rhs: Int) -> Int
    func devide(_ lhs: Int, _ rhs: Int) -> Int
}

protocol StringCalcuratorProtocol {
    func calcurate(_ string: String?) throws -> Int
}

final class StringCalcurator: StringCalcuratorProtocol, ArithmeticProtocol {
    enum InputError: Error {
        case `nil`
        case empty
        case noNumbers
        case noOperators
    }
    
    private enum ArithmeticOperations: String, CaseIterable {
        case add = "+"
        case substract = "-"
        case mutiply = "X"
        case devide = "/"
        
        static func factory(_ string: String) -> ArithmeticOperations? {
            let arithmeticOperation  = ArithmeticOperations
                .allCases
                .filter { $0.rawValue == string }
                .first
            return arithmeticOperation
        }
    }
    
    func calcurate(_ string: String?) throws -> Int {
        guard let string = string else { throw InputError.nil }
        guard !string.isEmpty else { throw InputError.empty }
        
        let organizedArray = string
            .split(separator: " ")
        
        var numbers = organizedArray
            .compactMap { Int($0) }
        
        guard !numbers.isEmpty else { throw InputError.noNumbers }
        
        let operators = organizedArray
            .filter { $0 == "+"
                || $0 == "-"
                || $0 == "X"
                || $0 == "/" }
            .map { String($0) }
            .map { ArithmeticOperations.factory($0) }
        
        guard !operators.isEmpty else { throw InputError.noOperators }
        
        var result = numbers.removeFirst()
        
        try? operators
            .enumerated()
            .forEach {
                switch $0.element {
                case .add: result = add(result, numbers[$0.offset])
                case .substract: result = substract(result, numbers[$0.offset])
                case .mutiply: result = multiply(result, numbers[$0.offset])
                case .devide: result = devide(result, numbers[$0.offset])
                case .none: throw InputError.noOperators
                }
            }
        
        return result
    }
}

extension StringCalcurator {
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func devide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
}
