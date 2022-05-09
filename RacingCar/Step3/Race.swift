//
//  Race.swift
//  RacingCar
//
//  Created by main on 2022/05/09.
//

import Foundation

enum RaceError: Error {
    case roundOverflow
}

final class Race {
    private let cars: Cars
    private var currentRound: Int = 0
    private let maxRound: Int
    
    init(carCount: Int, roundCount: Int) {
        self.cars = Cars(carCount: carCount)
        self.maxRound = roundCount
    }
    
    func run() throws {
        guard currentRound < maxRound else {
            throw RaceError.roundOverflow
        }
        
        cars.runRace()
        currentRound += 1
    }
}
