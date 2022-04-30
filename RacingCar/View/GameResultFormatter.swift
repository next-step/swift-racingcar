//
//  GameResultFormatter.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

struct GameResultFormatter {
    private static let newLine = "\n"
    private static let movementSymbol = "_"
    
    static func format(_ gameResult: RacingGameResult) -> String {
        var result = ""
        
        for roundResult in gameResult.racingRoundResut {
            result += format(roundResult)
            result += newLine
        }
        
        return result
    }
    
    private static func format(_ roundResult: RacingRoundResult) -> String {
        var result = ""
        
        for carState in roundResult.value {
            result += format(carState)
            result += newLine
        }
        
        return result
    }
    
    private static func format(_ carState: RacingCar.State) -> String {
        var result = ""
        
        (0..<carState.location).forEach { _ in
            result += movementSymbol
        }
        
        return result
    }
}
