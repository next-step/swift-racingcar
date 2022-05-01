//
//  RacingCarController.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/05/01.
//

import Foundation

final class RacingCarController {
    
    // MARK: - Property
    private(set) var cars: [Car] = []
    private(set) var tryCount: Int = 0
    
    // MARK: - Method
    func start(carCount: Int, tryCount: Int) throws {
        createCars(input: carCount)
        self.tryCount = tryCount
        try Racing().runRacing(tryCount: tryCount, cars: cars) { cars in
            RacingCarInputOutput.printResult(cars)
        }
    }
    
    private func createCars(input: Int) {
        var count = input
        while count != 0 {
            cars.append(Car())
            count -= 1
        }
    }
}
