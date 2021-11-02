//
//  RacingCar.swift
//  RacingCar
//
//  Created by sangsun on 2021/11/03.
//

import Foundation

struct RacingCar {
        
    var cars: [Car]?
    var tryCount: Int = 0
    
    /// UI
    mutating func inputView() {
        print("자동차 대수는 몇 대인가요? ", terminator: "")
        guard let input = readLine(), let carCount = Int(input) else {
            print("입력값이 숫자가 아닙니다.")
            return
        }
        genereteCar(input: carCount)
        
        print("시도할 횟수는 몇 회인가요? ", terminator: "")
        guard let input = readLine(), let count = Int(input) else {
            print("입력값이 숫자가 아닙니다.")
            return
        }
        tryCount = count
    }
    
    /// Helper
    mutating func genereteCar(input: Int) {
        cars = [Car](repeating: Car(), count: input)
    }
    
    ///
    func startRace() {
        
    }
}

struct Car {
    
}
