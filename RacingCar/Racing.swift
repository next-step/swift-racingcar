//
//  Racing.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/27.
//

import Foundation

final class Racing {
    
    // MARK: - Method
    func runRacing(tryCount: Int, cars: [Car], completion: ([Car]) -> Void) throws {
        var tryCount = tryCount
        while tryCount != 0 {
            try cars.forEach { car in
                try car.move(randomNumber: car.generateRandomNumber())
            }
            tryCount -= 1
            completion(cars)
        }
    }
}
