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
        if let count = try? Step3InputOutput.inputCarCount() {
            createCars(input: count)
        }
        
        if let count = try? Step3InputOutput.inputTryCount() {
            inputTryCount(input: count)
        }
        try racing()
    }
    
    func createCars(input: Int) {
        var count = input
        while count != 0 {
            cars.append(Car())
            count -= 1
        }
    }
    
    func inputTryCount(input: Int) {
        let count = input
        tryCount = count
    }
    
    private func racing() throws {
        try runRacing {
            Step3InputOutput.printResult(cars)
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
}
