//
//  RacingCarValidationCheck.swift
//  RacingCar
//
//  Created by 임현규 on 2021/11/02.
//

import Foundation

struct RacingCarValidationCheck {
    let firstInput: String
    let secondInput: String
    
    init(_ first: String,_ second: String) {
        self.firstInput = first
        self.secondInput = second
    }
    
    var isIntableString: Bool {
        if firstInput.toInt() == nil {
            fatalError()
        }
        return false
    }
}
