//
//  Step2_StringOperation.swift
//  RacingCar
//
//  Created by 임현규 on 2021/10/29.
//

import Foundation

enum CalculatorError: Error {
    case inputNil
    case emptyString
    case emptyOperator
    case error
    case convertError
    
    var description: String {
        switch self {
        case .inputNil: return "inputNil"
        case .emptyString: return "emptyString"
        case .emptyOperator: return "empty Operator"
        case .error: return "can not Calculate"
        case .convertError: return "can not convert"
        }
    }
}

enum OperatorType: String {
    case add = "+"
    case minus = "-"
    case multiple = "*"
    case divide = "/"
    case none
}

struct StringCalculator {
    func startStringCalculate(data: String) -> Int {
        let splitString = data.split(separator: " ").map { "\($0)" }
        let operatorbleData = filterOperatorbleData(data: splitString)
        let intAbleData = filterIntAbleString(data: splitString)
        if isHasValidationOperator(data: operatorbleData) && isHasIntAbleString(data: intAbleData) {
            return calculateString(data: splitString)
        }
        fatalError(CalculatorError.error.description)
    }
    
    func filterOperatorbleData(data: [String]) -> [String] {
        let operatorbleData = data.enumerated().filter { index, data in
            if index % 2 == 1 {
                return true
            }
            return false
        }.map { "\($0)" }
        return operatorbleData
    }

    func isHasValidationOperator(data: [String]) -> Bool {
        let isOperator = data
            .map { OperatorType(rawValue: $0) ?? .none }
            .filter {
            if $0 == .add || $0 == .minus || $0 == .multiple || $0 == .divide {
                return true
            }
            return false
        }

        return data.count == isOperator.count ? true : false
    }
    
    func filterIntAbleString(data: [String]) -> [String] {
        let intAbleStrings = data.enumerated().filter { index, data in
            if index % 2 == 0 {
                return true
            }
            return false
        }.map { "\($0)" }
        return intAbleStrings
    }

    func isHasIntAbleString(data: [String]) -> Bool {
        let isHasIntAbleString = data
            .map { OperatorType(rawValue: $0) ?? .none }
            .filter {
                if $0 == .add || $0 == .minus || $0 == .multiple || $0 == .divide {
                    return false
                }
                return true
            }
        return data.count == isHasIntAbleString.count ? true : false
    }

    func calculateString(data: [String]) -> Int {
        var lhs: Int?
        var rhs: Int?
        var operatorSymbol: OperatorType?
        for i in data {
            if i.toInt() == nil {
                let i = OperatorType(rawValue: i) ?? .none
                switch i {
                case .add:
                    operatorSymbol = .add
                case .minus:
                    operatorSymbol = .minus
                case .divide:
                    operatorSymbol = .divide
                case .multiple:
                    operatorSymbol = .multiple
                case .none:
                    fatalError(CalculatorError.emptyOperator.description)
                }
                continue
            }
            if lhs == nil {
                guard let i = i.toInt() else { fatalError(CalculatorError.convertError.description) }
                lhs = i
                continue
            }
            if rhs == nil {
                guard let i = i.toInt() else { fatalError(CalculatorError.convertError.description) }
                rhs = i
            }
            if lhs != nil && operatorSymbol != nil && rhs != nil {
                switch operatorSymbol {
                case .add:
                    lhs = add(lhs ?? 0, rhs ?? 0)
                case .minus:
                    lhs = minus(lhs ?? 0, rhs ?? 0)
                case .multiple:
                    lhs = multiple(lhs ?? 0, rhs ?? 0)
                case .divide:
                    lhs = divide(lhs ?? 0, rhs ?? 0)
                
                default:
                    continue
                }
                rhs = nil
            }
        }
        return lhs ?? 0
    }

    func add(_ lhs: Int,_ rhs: Int) -> Int {
        return lhs + rhs
    }

    func minus(_ lhs: Int,_ rhs: Int) -> Int {
        return lhs - rhs
    }

    func multiple(_ lhs: Int,_ rhs: Int) -> Int {
        return lhs * rhs
    }

    func divide(_ lhs: Int,_ rhs: Int) -> Int {
        return lhs / rhs
    }
}
