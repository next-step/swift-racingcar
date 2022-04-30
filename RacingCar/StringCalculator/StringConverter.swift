//
//  StringConverter.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/27.
//

import Foundation

struct StringConverter {
    enum StringConverterError: Error {
        case convertToIntFail
    }
    
    func convertToInt(from input: String?) throws -> Int {
        guard let input = input,
            let result = Int(input) else {
            throw StringConverterError.convertToIntFail
        }
        return result
    }
}
