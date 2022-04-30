//
//  RacingRoundResult.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

struct RacingRoundResult: Equatable {
    static func == (lhs: RacingRoundResult, rhs: RacingRoundResult) -> Bool {
        return lhs.value  == rhs.value
    }
    
    typealias CarLocation = Int
    typealias CarId = Int
    
    let value: [RacingCar.State]
    
    init(states: [RacingCar.State]) {
        self.value = states
    }
}
