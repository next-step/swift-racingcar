//
//  RacingForwardLineMaker.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/29.
//

import Foundation

struct RacingForwardLineMaker {
    static func convertNumberToLine(move: Int) -> String {
        var line = ""
        
        for _ in 0..<move {
            line += "-"
        }
        
        return line
    }
}
