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
    case division = "/"
}

enum StringCalculatorError: Error {
    case invalidOperator
    case errorInCalculating
    case invalidNumber
}

struct StringCalculator {
    func add(_ lhs: Int,_ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func subtract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    func multiply(_ lhs: Int,  _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func division(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }

    func checkEmptyString(inputString: String?) -> Bool {
        guard let inputString = inputString else { return false }

        if inputString.replacingOccurrences(of: " ", with: "").isEmpty { return false }
        return true
    }

    func checkOperators(inputString: String) -> Bool {
        let valueArray = inputString.components(separatedBy: " ").filter{ !$0.isEmpty }
        let removeNum = valueArray.filter { Int($0) == nil }

        let invalidCalculator = removeNum.filter {
            Operator(rawValue: $0) == nil
        }
        
        return invalidCalculator.isEmpty
    }

    func doAllCalculations(inputString: String) throws -> Int {
        if !checkOperators(inputString: inputString) { throw StringCalculatorError.invalidOperator }
        
        let valueArray = inputString.components(separatedBy: " ").filter { !$0.isEmpty }
        var numberArray  = valueArray.filter { Int($0) != nil }
        var operatorArray = valueArray.filter { Int($0) == nil }
        
        let minimumCalculateValidCount = 1
        
        while( numberArray.count > minimumCalculateValidCount ) {
            let result = calculator(lhs: Int(numberArray.removeFirst())!,
                                    inputOperator: Operator(rawValue: operatorArray.removeFirst())!,
                                    rhs: Int(numberArray.removeFirst())!)
            numberArray.insert(String(result), at: 0)
        }
        
        guard let resultNumString = numberArray.first else { throw StringCalculatorError.errorInCalculating }
        
        guard let resultNum = Int(resultNumString) else { throw StringCalculatorError.invalidNumber }
        
        return Int(resultNum)
    }
    
    func calculator(lhs: Int, inputOperator: Operator, rhs: Int) -> Int {
        switch inputOperator {
        case .add:
            return add(lhs, rhs)
        case .subtract:
            return subtract(lhs, rhs)
        case .multiply:
            return multiply(lhs, rhs)
        case .division:
            return division(lhs, rhs)
        }
    }
}
