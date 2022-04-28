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
    private(set) var raceRecords: [[Car]] = []
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
            let lastRaceRecord = raceRecords.last ?? initialRaceRecord()
            let newRaceRecord = newRaceRecord(from: lastRaceRecord)
            raceRecords.append(newRaceRecord)
        }
    }
    
    private func initialRaceRecord() -> [Car] {
        let startPosition: Int = 0
        return Array(repeating: Car(position: startPosition),
                     count: carCount)
    }
    
    private func newRaceRecord(from cars: [Car]) -> [Car] {
        let newRaceRecord: [Car] = cars
            .map { car -> (Car, Bool) in
                let randomNumber: Int = randomDigitNumberMaker.random()
                let canGoForward: Bool = randomNumber >= 4
                return (car, canGoForward)
            }
            .map { car, canGoForward -> Int in
                let originalPosition = car.position
                let newPosition = canGoForward ? originalPosition + 1 : originalPosition
                return newPosition
            }
            .map(Car.init)
        return newRaceRecord
    }
}
