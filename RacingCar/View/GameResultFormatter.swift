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
    private static let comma = ","
    
    static func format(_ winners: [RacingCar]) -> String {
        return winners.reduce("") { partialResult, racingCar in
            partialResult + comma + racingCar.name
        }
    }
    
    static func format(_ racingRounds: [RacingRound]) -> String {
        var result = ""
        
        for roundResult in racingRounds {
            result += format(roundResult)
            result += newLine
        }
        
        return result
    }
    
    private static func format(_ racingRound: RacingRound) -> String {
        var result = ""
        
        for racingCar in racingRound.racingCars {
            result += format(racingCar)
            result += newLine
        }
        
        return result
    }
    
    private static func format(_ racingCar: RacingCar) -> String {
        var result = ""
        
        (0..<racingCar.location).forEach { _ in
            result += movementSymbol
        }
        
        return result
    }
}
