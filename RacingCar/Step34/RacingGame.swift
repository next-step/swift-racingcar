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
            
    func startRacingGame(nameOfCars: [String], numberOfAttempts: Int) throws {
        self.beginToMoveCar(cars: try CarsFactory().makeCars(nameOfCars: nameOfCars, numberOfCars: nameOfCars.count), numberOfAttempts: numberOfAttempts)
    }
    
    private func beginToMoveCar(cars: [Car], numberOfAttempts: Int) {
        
        
        ResultView().printResultTitle()
        for _ in 0 ..< numberOfAttempts {
            attemptToMoveCar(cars: cars)
            print("")
        }
        
        findWinner(cars: cars)
    }
    
    private func attemptToMoveCar(cars: [Car]) {
        cars.forEach { car in
            car.move(amount: randomNumber)
            printResult(car: car)
        }
    }
    
    func findWinner(cars: [Car]) {
        let winners = cars.filter { car in
            car.position.count == findMaxPosition(cars: cars)
        }.map { car in
            car.name
        }
        
        printWinner(winners: winners)
    }
    
    func findMaxPosition(cars: [Car]) -> Int? {
        cars.max { prev, next in
            prev.position < next.position
        }.map { car in
            car.position.count
        }
    }
    
    func printWinner(winners: [String]) {
        ResultView().printWinner(winners: winners)
    }
    
    func printResult(car: Car) {
        ResultView().printResult(name: car.name, position: car.position)
    }
}
