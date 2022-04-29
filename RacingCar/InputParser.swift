//
//  InputParser.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/29.
//

import Foundation

enum ParsingError: LocalizedError  {
    case inputIsEmpty
    case inputIsBlank
    case inputIsNil
    case invalidOpreator
    case invalidOperand
    
    var errorDescription: String? {
        switch self {
            
        case .inputIsEmpty:
            return "입력이 빈 문자열입니다."
        case .inputIsBlank:
            return "입력이 공백 문자열입니다."
        case .inputIsNil:
            return "입력이 nil입니다."
        case .invalidOpreator:
            return "연산자 위치에 잘못된 값이 위치합니다."
        case .invalidOperand:
            return "피연산자 위치에 잘못된 값이 위치합니다."
        }
    }
}

struct InputParser {
    static let blankSpace = " "
    
    static func parse(_ input: String?) throws -> ([Operation], [Int]){
        try checkValidity(of: input)
        let input = input!.components(separatedBy: blankSpace)
        
        let operands = try extractOperands(inputComponents: input)
        var operations = [Operation]()
        
        let operatorCandidates = stride(from: 1, to: input.count, by: 2)
                                .map { input[$0]}
    
        
        try operatorCandidates.forEach { candidate in
            let operation = try parseToOperation(inputComponent: candidate)
            operations.append(operation)
        }
        
        return (operations, operands)
    }
    
    private static func checkValidity(of input: String?) throws {
        guard let input = input  else {
            throw ParsingError.inputIsNil
        }
        
        if input.isEmpty {
            throw ParsingError.inputIsEmpty
        }
        
        if input == blankSpace {
            throw ParsingError.inputIsBlank
        }
    }
    
    private static func extractOperands(inputComponents: [String]) throws -> [Int] {
        let operandCandidates = stride(from: 0, to: inputComponents.count, by: 2)
                                .map { inputComponents[$0]}
        var operands = [Int]()
        
        try operandCandidates.forEach { candidate in
            let operand = try parseToOperand(inputComponent: candidate)
            operands.append(operand)
        }
        
        return operands
    }
    
    private static func parseToOperand(inputComponent: String) throws -> Int {
        guard let operand = Int(inputComponent) else {
            throw ParsingError.invalidOperand
        }
        
        return operand
    }
    
    private static func parseToOperation(inputComponent: String) throws -> Operation {
        switch inputComponent {
        case "+":
            return Plus()
        case "-":
            return Minus()
        case "*":
            return Multiplication()
        case "/":
            return Division()
        default:
            throw ParsingError.invalidOpreator
        }
    }
}
