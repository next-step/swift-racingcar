//
//  InputView.swift
//  RacingCar
//
//  Created by 조민호 on 2021/11/04.
//

import Foundation

struct InputView {
    private enum InputError: Error {
        case valueIsNil
        case valueIsEmpty
        case valueMustConvertToInt
        case valueMustPositiveNumber
    }
    
    private let numberOfCars = "자동차 대수는 몇 대인가요?"
    private let numberOfAttempts = "시도할 횟수는 몇 회인가요?"
    
    func inputNumberOfCars() throws -> Int {
        print(numberOfCars, terminator: " ")
        
        guard let input = readLine() else {
            throw InputError.valueIsNil
        }
                
        try checkValidInputValue(input: input)
        
        return try convertInputValueToInt(input: input)
    }
    
    func inputNumberOfAttempts() throws -> Int {
        print(numberOfAttempts, terminator: " ")
        
        guard let input = readLine() else {
            throw InputError.valueIsNil
        }
                
        try checkValidInputValue(input: input)
        
        return try convertInputValueToInt(input: input)
    }
    
    private func checkValidInputValue(input: String) throws {
        do {
            guard !input.isEmpty else {
                throw InputError.valueIsEmpty
            }
            
            guard Int(input) != nil else {
                throw InputError.valueMustConvertToInt
            }
            
            guard Int(input) ?? -1 > 0 else {
                throw InputError.valueMustPositiveNumber
            }
            
        } catch InputError.valueIsEmpty {
            print(InputError.valueIsEmpty)
        } catch InputError.valueMustConvertToInt {
            print(InputError.valueMustConvertToInt)
        } catch InputError.valueMustPositiveNumber {
            print(InputError.valueMustPositiveNumber)
        }
    }
    
    private func convertInputValueToInt(input: String) throws -> Int {
        guard let intNumber = Int(input) else {
            throw InputError.valueMustConvertToInt
        }
        
        return intNumber
    }
}
