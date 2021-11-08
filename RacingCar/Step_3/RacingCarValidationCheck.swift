//
//  RacingCarValidationCheck.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

struct RacingCarValidationCheck {
    let roundInput: String
    let carCountInput: String
    
    init(_ roundInput: String,_ carCountInput: String) {
        self.roundInput = roundInput
        self.carCountInput = carCountInput
    }
    
    func isIntAblestring() -> Bool {
        if roundInput.toInt() == nil {
            print(RacingCarError.playcarInputError.rawValue)
            return false
        }
        if carCountInput.toInt() == nil {
            print(RacingCarError.roundCountInputError.rawValue)
            return false
        }
        return true
    }
}
