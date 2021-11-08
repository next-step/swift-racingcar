//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 김효성 on 2021/10/28.
//

protocol StringCalculatorProtocol {
    func calculate(_ string: String?) throws -> Int
}

protocol CalculatorProtocol {
    func calculate(_ lhs: Int, _ rhs: Int) -> Int
}

struct AddCalculator: CalculatorProtocol {
    func calculate(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
}

struct SubstractCalculator: CalculatorProtocol {
    func calculate(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
}

struct MultiplyCalculator: CalculatorProtocol {
    func calculate(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
}

struct DevideCalculator: CalculatorProtocol {
    func calculate(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
}

final class StringCalculator: StringCalculatorProtocol {
    enum InputError: Error {
        case `nil`
        case empty
        case noNumbers
        case noOperators
    }
    
    private enum ArithmeticOperations: String {
        case add = "+"
        case substract = "-"
        case mutiply = "X"
        case devide = "/"
    }
    
    let addCalculator: CalculatorProtocol
    let substractCalculator: CalculatorProtocol
    let multiplyCalculator: CalculatorProtocol
    let devideCalculator: CalculatorProtocol
    
    init(addCalculator: CalculatorProtocol,
         substractCalculator: CalculatorProtocol,
         multiplyCalculator: CalculatorProtocol,
         devideCalculator: CalculatorProtocol) {
        self.addCalculator = addCalculator
        self.substractCalculator = substractCalculator
        self.multiplyCalculator = multiplyCalculator
        self.devideCalculator = devideCalculator
    }
    
    func calculate(_ string: String?) throws -> Int {
        guard let string = string else { throw InputError.nil }
        guard !string.isEmpty else { throw InputError.empty }
        
        let organizedArray = removeSpace(string)
        
        var numbers = filterNumbers(organizedArray)
        guard !numbers.isEmpty else { throw InputError.noNumbers }
        
        let operators = filterOprators(organizedArray)
        guard !operators.isEmpty else { throw InputError.noOperators }
        
        var result = numbers.removeFirst()
        
        operators
            .enumerated()
            .forEach {
                switch $0.element {
                case .add: result = addCalculator.calculate(result, numbers[$0.offset])
                case .substract: result = substractCalculator.calculate(result, numbers[$0.offset])
                case .mutiply: result = multiplyCalculator.calculate(result, numbers[$0.offset])
                case .devide: result = devideCalculator.calculate(result, numbers[$0.offset])
                }
            }
        
        return result
    }
}

extension StringCalculator {
    private func removeSpace(_ string: String) -> [String] {
        return string
            .split(separator: " ")
            .map { String($0) }
    }
    
    private func filterNumbers(_ strings: [String]) -> [Int] {
        return strings
            .compactMap { Int($0) }
        
    }
    
    private func filterOprators(_ strings: [String]) -> [ArithmeticOperations] {
        return strings
            .filter { $0 == "+"
                || $0 == "-"
                || $0 == "X"
                || $0 == "/" }
            .map { String($0) }
            .compactMap { ArithmeticOperations.init(rawValue: $0 ) }
    }
}
