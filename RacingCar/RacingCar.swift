//
//  RacingCar.swift
//  RacingCar
//
//  Created by sangsun on 2021/11/03.
//

import Foundation

struct InputView {
    
    static func getCarCount() -> Int {
        print("자동차 대수는 몇 대인가요? ", terminator: "")
        guard let input = readLine(), let carCount = Int(input) else {
            print("입력값이 숫자가 아닙니다.")
            return -1
        }
        return carCount
    }
    
    static func getTryCount() -> Int {
        print("시도할 횟수는 몇 회인가요? ", terminator: "")
        guard let input = readLine(), let count = Int(input) else {
            print("입력값이 숫자가 아닙니다.")
            return -1
        }
        return count
    }
}

struct ResultView {
    static func showResult(cars: [Car]) {
        for i in 0..<cars.count {
            cars[i].printDistance()
        }
        print()
    }
}

struct RacingCar {
        
    var cars: [Car] = []
    var tryCount: Int = 0
    
    /// UI
    mutating func prepareRace() {
        genereteCar(input: InputView.getCarCount())
        tryCount = InputView.getTryCount()
    }
    
    func showResult() {
        ResultView.showResult(cars: cars)
    }
    
    /// Helper
    mutating func genereteCar(input: Int) {
        cars = [Car](repeating: Car(), count: input)
    }
    
    /// Logic
    mutating func startRace() {
        print("실행결과")
        for _ in 0..<tryCount {
            driveCars()
            showResult()
        }
    }
    
    mutating func driveCars() {
        for i in 0..<cars.count {
            cars[i].race()
        }
    }
}

struct Car {
    var distance: Int = 0
    
    mutating func race() {
        move(judge: dice())
    }
    
    func dice() -> Int {
        return Int.random(in: 0...9)
    }
    
    mutating func move(judge: Int) {
        if judge > 3 {
            distance = distance + 1
        }
    }
    
    func printDistance() {
        print(Array<String>(repeating: "-", count: distance).reduce("") { $0 + $1 })
    }
}
