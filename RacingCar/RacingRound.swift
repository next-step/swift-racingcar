//
//  Round.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

protocol RacingRound {
    var racingCars: [RacingCar] { get }
    func start() -> RacingRound
}

extension RacingRound where Self: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.racingCars == rhs.racingCars
    }
}

enum NormalRacingRoundError: LocalizedError {
    case invalidRacingCarCount(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidRacingCarCount(let invalidCount):
            return "RacingRound는 1개 이상의 RacingCar만 가질 수 있습니다. 현재 RacingCar 개수: \(invalidCount)"
        }
    }
}

struct NormalRacingRound: RacingRound, Equatable {
    static let minRacingCarCount = 1
    let racingCars: [RacingCar]
    
    init(racingCars: [RacingCar]) throws {
        if racingCars.count < Self.minRacingCarCount {
            throw NormalRacingRoundError.invalidRacingCarCount(racingCars.count)
        }
        self.racingCars = racingCars
    }
    
    func start() -> RacingRound {
        let copiedCars = racingCars.copy()
        copiedCars.forEach { $0.move() }
        return try! NormalRacingRound(racingCars: copiedCars)
    }
}
