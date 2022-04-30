//
//  GameResultFormatter.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

struct GameResultFormatter {
    static func format(_ gameResult: RacingGameResult) -> String {
        var result = ""
        
        for roundResult in gameResult.racingRoundResut {
            for racingCar in roundResult.racingCars {
                (0..<racingCar.location).forEach { _ in
                    result += "_"
                }
                result += "/n"
            }
            result += "/n"
        }
        return result
    }
}
