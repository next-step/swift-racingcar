//
//  RacingCarGame.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

final class RacingCarGame {
    
    private let carCount: Int
    private let raceCount: Int
    private(set) var raceRecords: [[Int]] = []
    private let randomDigitNumberMaker: RandomNumberMakable
    
    init(carCount: Int,
         raceCount: Int,
         randomDigitNumberMaker: RandomNumberMakable) {
        self.carCount = carCount
        self.raceCount = raceCount
        self.randomDigitNumberMaker = randomDigitNumberMaker
    }
    
    func start() {
        (1...raceCount).forEach { _ in
            let lastRaceRecord = raceRecords.last ?? initialCarPositions()
            let newRaceRecord = newCarPositions(from: lastRaceRecord)
            raceRecords.append(newRaceRecord)
        }
    }
    
    private func initialCarPositions() -> [Int] {
        let startPosition: Int = 0
        return Array(repeating: startPosition, count: carCount)
    }
    
    private func newCarPositions(from carPositions: [Int]) -> [Int] {
        let carPositions: [Int] = carPositions.map { carPosition -> Int in
            let randomNumber: Int = randomDigitNumberMaker.random()
            let canGoForward: Bool = randomNumber >= 4
            let carNewPosition: Int = canGoForward ? carPosition + 1 : carPosition
            return carNewPosition
        }
        return carPositions
    }
}
