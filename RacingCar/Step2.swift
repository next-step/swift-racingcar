//
//  Step2.swift
//  RacingCar
//
//  Created by Dustin on 2022/04/29.
//

import Foundation


struct Step2 {
   
   private enum OperatorType: String ,CaseIterable {
      case add = "+"
      case subtract = "-"
      case multiply = "*"
      case divide = "/"
   }
   
   private enum CalculatorError: LocalizedError {
      case inputNill
      case isEmpty
      case invalidOperator
      
      var errorDescription: String? {
         switch self {
         case .inputNill:
            return "입력 값이 nil"
         case .isEmpty:
            return "빈 공백 문자"
         case .invalidOperator:
            return "사칙 연산 기호 아님"
         }
      }
   }
   
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func substract(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs - rhs
    }
    
    
    func multiply(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs * rhs
    }
    
    
    func divide(_ lhs: Int, _ rhs: Int) -> Int {
        return lhs / rhs
    }
    
    func inputCalculatorCharactor(_ lhs: Int,_ input: String,_ rhs: Int) -> Int? {

        switch input {
        case OperatorType.add.rawValue:
            return add(lhs, rhs)
        case OperatorType.subtract.rawValue:
            return substract(lhs, rhs)
        case OperatorType.multiply.rawValue:
            return multiply(lhs, rhs)
        case OperatorType.divide.rawValue:
            return divide(lhs, rhs)
        default:
           return nil
        }
    }
   
    func splitString(_ input: String) throws -> [String] {
      guard input.isEmpty else { throw CalculatorError.inputNill }
      guard input == "" else { throw CalculatorError.isEmpty }
      guard input.contains(OperatorType.allCases.description) else { throw CalculatorError.invalidOperator }
      
      return input.components(separatedBy: "")
   }
    
    func stringCalculator(_ input: [String]) -> Int {
        var input: [String] = input

        var result: Int = 0
        for _ in 0..<input.count / 2 {
           result = inputCalculatorCharactor(Int(input[0]) ?? 0, input[1], Int(input[2]) ?? 0)!
           input.removeSubrange(0...2)
           input.insert(String(result), at: 0)
        }
        return result
    }
    
}
