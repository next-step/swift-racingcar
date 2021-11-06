//
//  RacingGame.swift
//  RacingCar
//
//  Created by 조민호 on 2021/11/05.
//

import Foundation

enum GameOption {
    static let defaultPosition: String = ""
    static let minimumMovementDistance: Int = 4
    static let randomNumberRange: ClosedRange = 0...9
    static let moveDistance: String = "-"
}

struct RacingGame {
    enum RacingGameError: Error {
        case notExistCar
    }
    
    private var randomNumber: Int {
        Int.random(in: GameOption.randomNumberRange)
    }
            
    func createCars() {
        guard let numberOfCars = try? InputView().inputNumberOfCars() else {
            return
        }
        
        startValidCheck(numberOfCars: numberOfCars)
    }
    
    private func start(cars: [Car]) {
        guard let numberOfAttempts = try? InputView().inputNumberOfAttempts() else {
            return
        }
        
        ResultView().printResultTitle()
        for _ in 0 ..< numberOfAttempts {
            for carIndex in 0 ..< cars.count {
                cars[carIndex].move(amount: randomNumber)
                ResultView().printResult(result: cars[carIndex].position)
            }
            print("")
        }
    }
    
    private func startValidCheck(numberOfCars: Int) {
        do {
            self.start(cars: try CarsFactory().makeCars(numberOfCars: numberOfCars))
        } catch {
            print(RacingGameError.notExistCar)
            print(error)
        }
    }
}
