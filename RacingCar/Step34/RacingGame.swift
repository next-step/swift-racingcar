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
            
//    func startRacingGame() throws {
//        guard let numberOfCars = try? InputView().inputNumberOfCars() else {
//            return
//        }
//                
//        self.beginToMoveCar(cars: try CarsFactory().makeCars(numberOfCars: numberOfCars))
//    }
    
    private func beginToMoveCar(cars: [Car]) {
        guard let numberOfAttempts = try? InputView().inputNumberOfAttempts() else {
            return
        }
        
        ResultView().printResultTitle()
        for _ in 0 ..< numberOfAttempts {
            attemptToMoveCar(cars: cars)
            print("")
        }
    }
    
    private func attemptToMoveCar(cars: [Car]) {
        for carIndex in 0 ..< cars.count {
            cars[carIndex].move(amount: randomNumber)
            ResultView().printResult(result: cars[carIndex].position)
        }
    }
}
