//
//  StringCalculator.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

private struct BinaryOperation {
    let lhs: String
    let `operator`: String
    let rhs: String
}

private enum Operator: String, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
}

struct StringCalculator {
    
    enum StringCalculatorError: Error {
        case containInvalidComponent
        case emptyArithmeticExpression
        case resultInDouble
        case invalidOperand
        case invalidOperator
        case remainUncalculatedComponent
        case divideByZero
    }
    
    private let stringConverter = StringConverter()
    
    func calculate(_ arithmeticExpression: String?) throws -> Int {
        guard let arithmeticExpression = arithmeticExpression,
              !arithmeticExpression.isEmpty else {
                  throw StringCalculatorError.emptyArithmeticExpression
              }
        
        let arithmeticComponents: [String] = try seperateValidArithmeticComponent(from: arithmeticExpression)
        let calculatedComponents = try reduceComponentsByCalculatingInOrder(from: arithmeticComponents)
        
        let isAllComponentsCalculated: Bool = calculatedComponents.count == 1
        guard isAllComponentsCalculated else {
            throw StringCalculatorError.remainUncalculatedComponent
        }
        
        let result: Int = try stringConverter.convertToInt(from: calculatedComponents.first)
        return result
    }
    
    private func reduceComponentsByCalculatingInOrder(from arithmeticComponents: [String]) throws -> [String] {
        var arithmeticComponents = arithmeticComponents
        let minimumCountToCalculate: Int = 3
        while(arithmeticComponents.count >= minimumCountToCalculate) {
            let binaryOperation = BinaryOperation(lhs: arithmeticComponents.removeFirst(),
                                                  operator: arithmeticComponents.removeFirst(),
                                                  rhs: arithmeticComponents.removeFirst())
            let result: Int = try calculate(binaryOperation)
            arithmeticComponents.insert(String(result), at: 0)
        }
        return arithmeticComponents
    }
    
    private func calculate(_ binaryOperation: BinaryOperation) throws -> Int {
        let (lhs, rhs): (Int, Int) = try convertStringOperandToInt(lhs: binaryOperation.lhs,
                                                                   rhs: binaryOperation.rhs)
        switch Operator(rawValue: binaryOperation.operator) {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        case .divide:
            return try divide(lhs: lhs, rhs: rhs)
        default:
            throw StringCalculatorError.invalidOperator
        }
    }
    
    private func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    private func subtract(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    private func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
    private func divide(lhs: Int, rhs: Int) throws -> Int {
        let isDenominatorZero: Bool = rhs == 0
        guard !isDenominatorZero else {
            throw StringCalculatorError.divideByZero
        }
        
        let isDivisible: Bool = lhs % rhs == 0
        guard isDivisible else {
            throw StringCalculatorError.resultInDouble
        }
        
        let result: Int = lhs / rhs
        return result
    }
    
    private func convertStringOperandToInt(lhs: String, rhs: String) throws -> (lhs: Int, rhs: Int) {
        do {
            let lhs: Int = try stringConverter.convertToInt(from: lhs)
            let rhs: Int = try stringConverter.convertToInt(from: rhs)
            return (lhs, rhs)
        } catch {
            throw StringCalculatorError.invalidOperand
        }
    }
    
    private func seperateValidArithmeticComponent(from input: String) throws -> [String] {
        let components: [String] = input.components(separatedBy: " ")
        
        let isAllComponentsValid: Bool = isValidArithmeticComponents(components)
        guard isAllComponentsValid else {
            throw StringCalculatorError.containInvalidComponent
        }
        
        return components
    }
    
    private func isValidArithmeticComponents(_ components: [String]) -> Bool {
        let isValidArithmeticComponents: Bool = components.allSatisfy { component in
            isArithmeticOperator(component) || isNumber(component)
        }
        return isValidArithmeticComponents
    }
    
    private func isArithmeticOperator(_ operator: String) -> Bool {
        let arithmeticOperators: [String] = Operator.allCases
            .map {
                $0.rawValue
            }
        let isArithmeticOperator: Bool = arithmeticOperators.contains(`operator`)
        return isArithmeticOperator
    }
    
    private func isNumber(_ input: String) -> Bool {
        guard !input.isEmpty else {
            return false
        }
        let isNumber: Bool = CharacterSet.decimalDigits
            .isSuperset(of: CharacterSet(charactersIn: input))
        return isNumber
    }
}
