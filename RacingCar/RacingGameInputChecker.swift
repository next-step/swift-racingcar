//
//  RacingGameInputChecker.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/05/03.
//

import Foundation

final class RacingGameInputChecker {
    
    let validator: Validator = Validator()
    let converter: Converter = Converter()
    
    class Validator {
        func checkValidation(carNames: [String]) throws {
            guard !carNames.isEmpty else { throw InputViewError.emptyCars }
            guard carNames.filter({ $0.count > 5 }).count == 0 else { throw InputViewError.textLengthExceeded }
        }
        
        func checkValidation(count: Int) throws {
            guard count > -1 else { throw InputViewError.minusCount }
        }
        
        func checkValidation(input: String?) throws {
            guard input != nil else { throw InputViewError.input }
        }
    }
    
    class Converter {
        func converterToInteger(input: String) throws -> Int {
            guard let input = Int(input) else { throw InputViewError.incorrectFormat }
            return input
        }
        
        func converToUnwrapper<T>(value: T?) throws -> T {
            guard let value = value else { throw InputViewError.input }
            return value
        }
    }
}
