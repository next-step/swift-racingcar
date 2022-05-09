//
//  RaceRandomGenerator.swift
//  RacingCar
//
//  Created by main on 2022/05/09.
//

import Foundation

final class RaceRandomGenerator {
    private let range = (0...9)
    private let minimumToMove = 4
    
    func generateRunResult() -> Bool {
        let randomResult = Int.random(in: range)
        return randomResult >= minimumToMove
    }
}
