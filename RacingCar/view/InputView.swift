//
//  InputView.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/28.
//

class InputView {
    static func inputValidTest(_ input: String?) throws -> Int {
        if let input: String = input,
            let inputNumber: Int = Int(input) {
            return inputNumber
        }
        throw InputEror.invalidInput
    }
    
    static func inputReadLine() throws -> Int {
        if let input: String = readLine(),
           let inputNumber: Int = Int(input) {
            return inputNumber
        }
        throw InputEror.invalidInput
    }
}
