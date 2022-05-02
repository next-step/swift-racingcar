//
//  StringCalculatorInputChange.swift
//  RacingCar
//
//  Created by brian은석 on 2022/04/28.
//

import Foundation

struct StringCalculatorInputChange {
    
    func stringToInt(input:String) throws -> Int {
        guard let number = Int(input) else {
           throw StringCalculatorError.number
        }
        return number

    }
    
    func convertOperator(input:String) throws -> Operator {
        guard let myOperator = Operator(rawValue: input) else {
            throw StringCalculatorError.isNotOperator
        }
        return myOperator
    }
    
    func removeOptional(input:String?) throws -> String {
        guard let input = input else {
            throw StringCalculatorError.inputNil
        }
        return input
    }
    
    func separateByEmptyPlace(input:String) throws -> [String] {
        let result = input.components(separatedBy: " ")
        if result.isEmpty {
            throw StringCalculatorError.inputEmpty
        } else {
            return result
        }
    }
    
    func inputStringArrayCountIsOdd(input:[String]) throws -> Bool {
        guard input.count >= 3 && !input.count.isMultiple(of: 2) else {
            throw StringCalculatorError.calculator
        }
        return true
    }
}

