//
//  InputView.swift
//  RacingCar
//
//  Created by 조민호 on 2021/11/04.
//

import Foundation

struct InputView {
    private enum InputError: Error {
        case inputIsNil
        case inputIsEmpty
        case inputMustConvertToInt
        case inputMustPositiveNumber
    }
    
    private let numberOfCars = "자동차 대수는 몇 대인가요?"
    private let numberOfAttempts = "시도할 횟수는 몇 회인가요?"
    
    func inputNumberOfCars() throws -> Int {
        print(numberOfCars, terminator: " ")
        
        guard let input = readLine() else {
            throw InputError.inputIsNil
        }
                
        try inputValidCheck(input: input)
        
        return try inputConvertToInt(input: input)
    }
    
    func inputNumberOfAttempts() throws -> Int {
        print(numberOfAttempts, terminator: " ")
        
        guard let input = readLine() else {
            throw InputError.inputIsNil
        }
                
        try inputValidCheck(input: input)
        
        return try inputConvertToInt(input: input)
    }
    
    private func inputValidCheck(input: String) throws {
        do {
            guard !input.isEmpty else {
                throw InputError.inputIsEmpty
            }
            
            guard Int(input) != nil else {
                throw InputError.inputMustConvertToInt
            }
            
            guard Int(input) ?? -1 > 0 else {
                throw InputError.inputMustPositiveNumber
            }
            
        } catch InputError.inputIsEmpty {
            print(InputError.inputIsEmpty)
        } catch InputError.inputMustConvertToInt {
            print(InputError.inputMustConvertToInt)
        } catch InputError.inputMustPositiveNumber {
            print(InputError.inputMustPositiveNumber)
        }
    }
    
    private func inputConvertToInt(input: String) throws -> Int {
        guard let intNumber = Int(input) else {
            throw InputError.inputMustConvertToInt
        }
        
        return intNumber
    }
}
