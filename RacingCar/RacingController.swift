//
//  RacingController.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/05/01.
//

import Foundation

final class RacingController {
    
    // MARK: - Property
    private(set) var cars: [Car] = []
    
    // MARK: - Method
    func start(carNames: [String], racingCount: Int) throws {
        createCars(input: carNames)
        var racingCount: Int = racingCount
        
        while racingCount != 0 {
            try Racing().run(cars: cars,
                             completion: RacingCarOutput.printCars(_:))
            racingCount -= 1
        }
        
        endRacing { winners in
            RacingCarOutput.printWinners(winners.compactMap { $0 })
        }
    }
    
    private func createCars(input: [String]) {
        input.forEach { name in
            cars.append(Car(name: name))
        }
    }
    
    func endRacing(completion: ([String?]) -> Void) {
        var winner: [String?] = []
        let biggestMoveCount = getBiggestMoveCountCar()
        cars.forEach { car in
            let car = checkWinner(biggestMoveCount: biggestMoveCount,
                                  car: car)
            winner.append(car?.name)
        }
        completion(winner)
    }
    
    private func checkWinner(biggestMoveCount: Int, car: Car) -> Car? {
        if car.moveCount == biggestMoveCount {
            return car
        }
        return nil
    }
    
    private func getBiggestMoveCountCar() -> Int {
        var biggestMoveCount: Int = 0
        cars.forEach { car in
            biggestMoveCount = biggestMoveCount.getBiggestInt(with: car)
        }
        return biggestMoveCount
    }
}

fileprivate extension Int {
    func getBiggestInt(with car: Car) -> Int {
        return car.moveCount > self ? car.moveCount : self
    }
}
