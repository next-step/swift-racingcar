//
//  Game.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/28.
//

import Foundation

class Game {
    private let cars: [Car]
    private let count: Int
    
    init(cars: [Car], counts: Int) {
        self.cars = cars
        self.counts = counts
    }
}

extension Game {
    private func runOnce(_ car: Car) {
        let randomNumber: Int = GameOption.generateRandomNumber()
        
        if GameOption.canGoFoward(randomNumber) {
            car.moveFoward()
        }
    }
    
    private func runOneCycle(of cars: [Car]) {
        for car in cars {
            runOnce(car)
            ResultView.printResult(car)
        }
        print("")
    }
    
    func run() {
        print("\n실행 결과")
        
        for _ in 0..<counts {
            runOneCycle(of: cars)
        }
        
        ResultView.printWinner(cars)
    }
}
