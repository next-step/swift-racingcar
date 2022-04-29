//
//  Step3Input.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/29.
//

import Foundation

struct Step3InputOutput {
    
    private static func inputCount() throws -> Int {
        guard let countString = readLine(),
              let count = Int(countString) else { throw RacingCarStep3Error.inputError }
        return count
    }
    
    static func inputCarCount() throws -> Int {
        print("자동차 대수는 몇대인가요? ", terminator: "")
        return try inputCount()
    }
    
    static func inputTryCount() throws -> Int {
        print("시도할 횟수는 몇 회인가요?", terminator: "")
        return try inputCount()
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
