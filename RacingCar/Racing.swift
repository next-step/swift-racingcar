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
    func start(carCount: Int, tryCount: Int) throws {
        createCars(input: carCount)
        self.tryCount = tryCount
        try racing()
    }
    
    private func createCars(input: Int) {
        var count = input
        while count != 0 {
            cars.append(Car())
            count -= 1
        }
    }
    
    private func racing() throws {
        try runRacing {
            RacingCarInputOutput.printResult(cars)
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
