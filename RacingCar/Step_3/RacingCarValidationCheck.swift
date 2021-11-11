//
//  RacingCarValidationCheck.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

struct RacingCarValidationCheck {
    let racingInput: RacingInput
    
    init(racingInput: RacingInput) {
        self.racingInput = racingInput
    }
    
    func isIntAblestring() -> Bool {
        if racingInput.roundCount.toInt() == nil {
            print(RacingCarError.playcarInputError.rawValue)
            return false
        }
        if racingInput.roundCount.toInt() == nil {
            print(RacingCarError.roundCountInputError.rawValue)
            return false
        }
        return true
    }
}
