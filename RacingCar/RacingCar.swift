//
//  RacingCar.swift
//  RacingCar
//
//  Created by 현은백 on 2022/05/16.
//

import Foundation

class RacingCar {
    
    enum InputError: Error {
        case invalidInput
        case inputType
    }
    
    var numberOfCar = 0
    var numberOfTry = 0
    
    struct Car {
        var progress: Int = 0
        
        mutating func drive(isMoved: Bool) {
            if isMoved {
                progress += 1
            }
        }
    }
    
    init() {
        try? input()
        play()
    }
    
    func input() throws {
        print("자동차 몇대?")
        guard let userInput_1 = readLine() else { throw InputError.invalidInput }
        guard let numCars = Int(userInput_1) else { throw InputError.inputType }
        numberOfCar = numCars
        
        print("시도 몇회?")
        guard let userInput_2 = readLine() else { throw InputError.invalidInput }
        guard let numTry = Int(userInput_2) else { throw InputError.inputType }
        numberOfTry = numTry

    }
    
    func play() {
        var cars = Array(repeating: Car(), count: numberOfCar)
        print("실행 결과")
        for _ in 0..<numberOfTry {
            for j in 0..<numberOfCar {
                let isCarMoved = isMovable()
                cars[j].drive(isMoved: isCarMoved)
                printProgress(cars[j].progress)
            }
            print("")
        }
        print("실행 종료")
    }
    
    func isMovable() -> Bool {
        let rand = Int.random(in: 0...9)
        return rand > 3
    }
    
    func printProgress(_ progress: Int) {
        print(Array(repeating: "-", count: progress).joined())
    }
}
