//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by hakyung on 2022/05/03.
//
import Foundation

enum Operator: String, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
}

enum StringCalculatorError: Error {
    case invalidOperator
    case errorInCalculating
    case invalidNumber
}

struct StringCalculator {
    private func add(_ lhs: Int,_ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    private func subtract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    private func multiply(_ lhs: Int,  _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    private func divide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }

    func checkEmptyString(inputString: String?) -> Bool {
        guard let inputString = inputString else { return false }

        if inputString.replacingOccurrences(of: " ", with: "").isEmpty { return false }
        return true
    }

    func checkOperators(inputString: String) -> Bool {
        let valueArray = inputString.components(separatedBy: " ").filter{ !$0.isEmpty }
        let operaters = valueArray.filter { Int($0) == nil }

        let invalidOperators = operaters.filter {
            Operator(rawValue: $0) == nil
        }
        
        return invalidOperators.isEmpty
    }

    func doAllCalculations(inputString: String) throws -> Int {
        if !checkOperators(inputString: inputString) { throw StringCalculatorError.invalidOperator }
        
        let valueArray = inputString.components(separatedBy: " ").filter { !$0.isEmpty }
        var operandArray  = valueArray.filter { Int($0) != nil }
        var operatorArray = valueArray.filter { Int($0) == nil }
        
        let minimumCalculateValidCount = 1
        
        while(operandArray.count > minimumCalculateValidCount) {
            let result = calculator(lhs: Int(operandArray.removeFirst())!,
                                    inputOperator: Operator(rawValue: operatorArray.removeFirst())!,
                                    rhs: Int(operandArray.removeFirst())!)
          operandArray.insert(String(result), at: 0)
        }
        
        guard let resultNumString = operandArray.first else { throw StringCalculatorError.errorInCalculating }
        
        guard let resultNum = Int(resultNumString) else { throw StringCalculatorError.invalidNumber }
        
        return Int(resultNum)
    }
    
    private func calculator(lhs: Int, inputOperator: Operator, rhs: Int) -> Int {
        switch inputOperator {
        case .add:
            return add(lhs, rhs)
        case .subtract:
            return subtract(lhs, rhs)
        case .multiply:
            return multiply(lhs, rhs)
        case .divide:
            return divide(lhs, rhs)
        }
    }
}
