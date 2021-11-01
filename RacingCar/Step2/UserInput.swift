//
//  UserInput.swift
//  RacingCar
//
//  Created by 조민호 on 2021/10/30.
//

import Foundation

struct UserInput {
    
    func inputExpression() throws -> [String] {
        
        print("계산할 문자열을 입력해주세요. ex) 2 + 3 * 4 / 2")
                
        guard let input = readLine() else {
            throw CalculatorError.valueIsNil
        }
        
        try inputValidCheck(input)
        
        return inputComponents(input)
    }
    
    func inputValidCheck(_ input: String) throws {

        guard !input.isEmpty else {
            throw CalculatorError.valueIsEmpty
        }

        guard input.first != " ",
              input.last != " "
        else {
            throw CalculatorError.valueHasWhiteSpace
        }
    }
    
    func inputComponents(_ input: String) -> [String] {
        return input.components(separatedBy: " ")
    }
}
