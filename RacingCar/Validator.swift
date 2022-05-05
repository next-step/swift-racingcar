//
//  Validator.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/05/01.
//

import Foundation

final class Validator {
    
    static func checkValidation(number: Int) -> Bool {
        guard (0 ... 9).contains(number) else {
            return false
        }
        return true
    }
    
    static func checkValidation(count: Int) -> Bool {
        guard count > 0 else {
            return false
        }
        return true
    }
    
    static func checkValidation(names: [String]) -> Bool {
        guard !names.isEmpty else {
            return false
        }
        var validateName: Bool = true
        names.forEach { name in
            if !checkValidation(name: name) {
                validateName = false
                return
            }
        }
        return validateName
    }
    
    private static func checkValidation(name: String) -> Bool {
        guard !name.isEmpty && name.count <= 5 else {
            return false
        }
        return true
    }
}
