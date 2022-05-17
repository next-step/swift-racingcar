//
//  RacingCar.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/12.
//

import Foundation

enum RacingError: Error {
    case racingCountIsLow
}

final class Racing {
    private var cars: [Car]
    private var moveCount: Int
    private let resultView = ResultView()
    
    
    init?(_ userInput: UserInput) throws{
        guard userInput.moveCount > 0 else {
            throw RacingError.racingCountIsLow
        }
        
        self.cars = try Car.generateCars(count: userInput.carCount)
        self.moveCount = userInput.moveCount
    }
    
    func start() {
        for _ in 0 ..< moveCount {
            self.moveCar()
        }
    }
    
    private func generateFuel() -> Fuel {
        return Fuel()
    }
    
    private func moveCar() {
        for i in 0 ..< cars.count {
            cars[i].moveFoward(fuel: generateFuel())
        }
        resultView.printCars(participatedCars: cars)
    }
}
