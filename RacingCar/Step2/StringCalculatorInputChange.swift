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
<<<<<<< HEAD
            throw StringCalculatorError.number
        }
        return number
        
=======
           throw StringCalculatorError.number
        }
        return number

>>>>>>> 742e65c (fix: Step2 reflect what has been reviewed)
    }
    
    func convertOperator(input:String) throws -> Operator {
        guard let myOperator = Operator(rawValue: input) else {
<<<<<<< HEAD
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
=======
            throw StringCalculatorError.operator
>>>>>>> 742e65c (fix: Step2 reflect what has been reviewed)
        }
        return myOperator
    }
    
<<<<<<< HEAD
    func split(input: String) throws -> [String] {
        var splitStingArray: [String] = []
        var tempValue = ""
        for character in input {
            if character == " " {
                splitStingArray.append(tempValue)
                splitStingArray.append(" ")
                tempValue = ""
            } else {
                tempValue += String(character)
            }
        }
        if splitStingArray.isEmpty {
            throw StringCalculatorError.inputEmpty
        } else {
            return splitStingArray
=======
    func emptyRemover(input:String?) throws -> [String] {
        guard let input = input else {
            throw StringCalculatorError.inputNil
>>>>>>> 742e65c (fix: Step2 reflect what has been reviewed)
        }
        let result = input.components(separatedBy: " ")
        if result.isEmpty {
            throw StringCalculatorError.inputEmpty
        } else {
            return result
        }
    }
    
    func removeEmpty(input: [String]) -> [String] {
        return input.filter{$0 != " "}
    }
    
    func inputStringArrayCountIsOdd(input:[String]) throws -> Bool {
        guard input.count >= 3 && !input.count.isMultiple(of: 2) else {
            throw StringCalculatorError.calculator
        }
        return true
    }
}

