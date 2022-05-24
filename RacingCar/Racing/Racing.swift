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

protocol RacingDelegate: AnyObject {
    func racingEnd(winnerCars: [Car])
    func racingProgress(participatedCars: [Car])
}

final class Racing {
    private var cars: [Car]
    private var moveCount: Int
    
    weak var delegate: RacingDelegate?
    
    init(_ userInput: UserInput) throws {
        guard userInput.moveCount > 0 else {
            throw RacingError.racingCountIsLow
        }
        
        self.cars = Car.generateCars(with: userInput.carNames)
        self.moveCount = userInput.moveCount
    }
    
    func start() {
        for _ in 0 ..< moveCount {
            self.moveCar()
        }
        racingEnd()
    }
    
    private func generateFuel() -> Fuel {
        return Fuel()
    }
    
    private func moveCar() {
        for i in 0 ..< cars.count {
            cars[i].moveFoward(fuel: generateFuel())
        }
        updateRacingProgress()
    }
    
    private func updateRacingProgress() {
        delegate?.racingProgress(participatedCars: cars)
    }
    
    private func racingEnd() {
        let winnerCars = winners(participatedCars: cars)
        delegate?.racingEnd(winnerCars: winnerCars)
    }
    
    func winners(participatedCars: [Car]) -> [Car] {
        let topScore = racingTopScore(participatedCars)
        let winners = participatedCars.filter { $0.moveDistance == topScore }
        return winners
    }
    
    func racingTopScore(_ cars: [Car]) -> Int {
        if let topScore = cars.compactMap({ $0.moveDistance }).max() {
            return topScore
        }
        return 0
    }
}
