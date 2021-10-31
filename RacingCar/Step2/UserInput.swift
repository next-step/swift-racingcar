//
//  UserInput.swift
//  RacingCar
//
//  Created by 조민호 on 2021/10/30.
//

import Foundation

struct UserInput {
    
    func inputExpression() -> [String] {
        
        print("계산할 문자열을 입력해주세요. ex) 2 + 3 * 4 / 2")
        
        let input = readLine()?.components(separatedBy: " ")
        
        guard let input = input else {
            fatalError(CalculatorError.valueIsNil.message())
        }

        guard !input.isEmpty else {
            fatalError(CalculatorError.valueIsEmpty.message())
        }

        guard !input.contains("") else {
            fatalError(CalculatorError.valueHasWhiteSpace.message())
        }
        
        print(input)
        
        return input
    }
}
