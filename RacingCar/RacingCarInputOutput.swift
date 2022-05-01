//
//  RacingCarInputOutput.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/29.
//

import Foundation

struct RacingCarInputOutput {
    
    private static func inputCount() throws -> Int {
        guard let countString = readLine(),
              let count = Int(countString) else { throw RacingCarError.input }
        return count
    }
    
    static func inputCarCount() throws -> Int {
        print("자동차 대수는 몇대인가요? ", terminator: "")
        let number = try inputCount()
        return try Validator.checkValidation(count: number)
    }
    
    static func inputTryCount() throws -> Int {
        print("시도할 횟수는 몇 회인가요?", terminator: "")
        let number = try inputCount()
        return try Validator.checkValidation(count: number)
    }
    
    private static func printMove(_ car: Car) {
        for _ in 0 ..< car.moveCount {
            print("-", terminator: "")
        }
        print("")
    }
    
    static func printResult(_ cars: [Car]) {
        cars.forEach { car in
            printMove(car)
        }
        print("")
    }
}
