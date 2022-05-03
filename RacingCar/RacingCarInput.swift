//
//  RacingCarInput.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/29.
//

import Foundation

struct RacingCarInput {
    
    private static func inputNames() throws -> String {
        guard let ownersString = readLine() else {
            throw RacingCarError.input
        }
        return ownersString
    }
    
    private static func inputCount() throws -> Int {
        guard let countString = readLine(),
              let count = Int(countString) else { throw RacingCarError.input }
        return count
    }
    
    static func inputCarCount() throws -> Int {
        print("자동차 대수는 몇대인가요? ", terminator: "")
        let number = try inputCount()
        guard Validator.checkValidation(count: number) else {
            throw RacingCarError.invalidNumber
        }
        return number
    }
    
    static func inputCarNames() throws -> [String] {
        print("경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분).")
        let names = try inputNames().components(separatedBy: ",")
        guard Validator.checkValidation(names: names) else {
            throw RacingCarError.invalidString
        }
        return names
    }
    
    static func inputTryCount() throws -> Int {
        print("시도할 횟수는 몇 회인가요?")
        let number = try inputCount()
        guard Validator.checkValidation(count: number) else {
            throw RacingCarError.invalidNumber
        }
        return number
    }
}
