//
//  UserInputValidator.swift
//  RacingCar
//
//  Created by 강수진 on 2022/05/01.
//

import Foundation

struct UserInputValidator {
    
    private enum Constants {
        static let maximumCarNameLength: Int = 5
        static let minimumRaceCountToStart: Int = 1
    }
    
    func isValideRaceCount(of raceCount: Int) -> Bool {
        return raceCount >= Constants.minimumRaceCountToStart
    }
    
    func isValidCarNames(of carNames: [String]) -> Bool {
        let isValidCarNames: Bool = carNames.allSatisfy { carName in
            carName.count <= Constants.maximumCarNameLength
        }
        return isValidCarNames
    }
}
