//
//  Cars.swift
//  RacingCar
//
//  Created by main on 2022/05/09.
//

import Foundation

final class Cars {
    private var cars: [CarState]
    private let randomGenerator = RaceRandomGenerator()
    
    init(carCount: Int) {
        cars = Array(repeating: CarState(position: 0), count: carCount)
    }
    
    func runRace() {
        var result: [CarState] = []
        
        cars.forEach { car in
            let runResult = runCar(car: car)
            result.append(runResult)
        }
        
        self.cars = result
    }
    
    private func runCar(car: CarState) -> CarState {
        guard randomGenerator.generateRunResult() else {
            return car
        }
        
        return CarState(position: car.position + 1)
    }
    
    func getCurrent() -> [CarState] {
        return cars
    }
}
