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
    
    var isIntAbleString: Bool {
        if roundInput.toInt() == nil {
            fatalError(RacingCarError.playcarInputError.rawValue)
        }
        if carCountInput.toInt() == nil {
            fatalError(RacingCarError.roundCountInputError.rawValue)
        }
        return true
    }
}
