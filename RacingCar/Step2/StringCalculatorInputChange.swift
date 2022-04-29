//
//  StringCalculatorInputChange.swift
//  RacingCar
//
//  Created by brian은석 on 2022/04/28.
//

import Foundation

struct StringCalculatorInputChange {
    
    func stringNumberToInt(input:String) throws -> Int {
        if let number = Int(input) {
            return number
        } else {
            throw StringCalculatorError.numberError
        }
    }
    
    func verifyOperator(input:String) throws -> StringOperator {
        if let myOperator = StringOperator(rawValue: input) {
            return myOperator
        } else {
            throw StringCalculatorError.operatorError
        }
    }
    
    func emptyRemover(input:String?) throws -> [String] {
        if let input = input {
            let result = input.components(separatedBy: " ")
            if result.isEmpty {
                throw StringCalculatorError.inputEmpty
            } else {
                return result
            }
        } else {
            throw StringCalculatorError.inputNil
        }
    }
    
    func inputStringArrayCountIsOdd(input:[String]) throws -> Bool {
        if input.count >= 3 && !input.count.isMultiple(of: 2) {
            return true
        } else {
            throw StringCalculatorError.calculatorError
        }
    }
}
//func stringNumberToInt(input:String) -> Int? {
//    if let number = Int(input) {
//        return number
//    } else {
//        return nil
//    }
//}
//
//func verifyOperator(input:String) -> StringOperator? {
//    if let myOperator = StringOperator(rawValue: input) {
//        return myOperator
//    } else {
//        return nil
//    }
//}
//
//func emptyRemover(input:String?) -> [String]? {
//    if let input = input {
//        let result = input.components(separatedBy: " ")
//        return result
//    } else {
//        return nil
//    }
//}
//
//func inputStringArrayCountIsOdd(input:[String]) -> Bool {
//    if input.count >= 3 && !input.count.isMultiple(of: 2) {
//        return true
//    } else {
//        return false
//    }
//}
