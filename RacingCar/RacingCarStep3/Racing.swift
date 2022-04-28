//
//  Racing.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/27.
//

import Foundation

final class Racing {
    
    // MARK: - Property
    private(set) var cars: [Car] = []
    private(set) var tryCount: Int = 0
    
    // MARK: - Method
    func start() throws {
        if let count = try? inputCount() {
            createCars(input: count)
        }
        
        if let count = try? inputCount() {
            inputTryCount(input: count)
        }
        try racing()
    }
    
    private func inputCount() throws -> Int {
        guard let countString = readLine(),
              let count = Int(countString) else { throw RacingCarStep3Error.inputError }
        return count
    }
    
    func createCars(input: Int) {
        print("자동차 대수는 몇대인가요?", terminator: "")
        var count = input
        while count != 0 {
            cars.append(Car())
            count -= 1
        }
    }
    
    func inputTryCount(input: Int) {
        print("시도할 횟수는 몇 회인가요?", terminator: "")
        let count = input
        tryCount = count
    }
    
    private func racing() throws {
        try runRacing {
            printResult()
        }
    }
    
    func runRacing(completion: () -> Void) throws {
        while tryCount != 0 {
            try cars.forEach { car in
                try car.move(randomNumber: car.generateRandomNumber())
            }
            tryCount -= 1
            completion()
        }
    }
    
    private func printResult() {
        cars.forEach { car in
            car.printMove()
        }
        print("")
    }
}
