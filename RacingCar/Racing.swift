//
//  Racing.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/27.
//

import Foundation

final class Racing {
    
    // MARK: - Method
    func run(cars: [Car], completion: ([Car]) -> Void) throws {
        try cars.forEach { car in
            try car.move(randomNumber: car.generateRandomNumber())
        }
        completion(cars)
    }
}
