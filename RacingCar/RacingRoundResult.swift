//
//  RacingRoundResult.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

struct RacingRoundResult: Equatable {
    static func == (lhs: RacingRoundResult, rhs: RacingRoundResult) -> Bool {
        return lhs.racingCars == rhs.racingCars
    }
    
    typealias Location = Int
    let racingCars: [RacingCar]
    
    subscript(racingCar: RacingCar) -> Location? {
        return racingCars.first { $0.id == racingCar.id }?.location
    }
}
