//
//  InputChecker.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

struct InputChecker {
    static func isValidCarCount(_ carCount: Int?) -> Bool {
        return carCount != nil && carCount! > 0
    }
    
    static func isValidRoundCount(_ roundCount: Int?) -> Bool {
        return roundCount != nil && roundCount! > 0
    }
}
