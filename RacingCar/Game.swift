//
//  Game.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/28.
//

import Foundation

class Game {
    private let cars: [Car]
    private let counts: Int
    
    init(cars: Int, counts: Int) {
        self.cars = Array(repeating: Car(), count: cars)
        self.counts = counts
    }
}

extension Game {
    static func generateRandomNumer() -> Int {
        return Int(arc4random_uniform(10))
    }
    
    static func canGoFoward(_ n: Int) -> Bool {
        return n >= 4
    }
    
    private func runOnce(_ car: Car) {
        let randomNumber: Int = Game.generateRandomNumer()
        
        if Game.canGoFoward(randomNumber) {
            car.foward()
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
    }
}
