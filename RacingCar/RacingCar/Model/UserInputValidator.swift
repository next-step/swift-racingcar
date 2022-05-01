//
//  UserInputValidator.swift
//  RacingCar
//
//  Created by 강수진 on 2022/05/01.
//

import Foundation

struct UserInputValidator {
    
    private enum Constants {
        static let carNameLengthRange: ClosedRange<Int> = {
            let minimumCarNameLength: Int = 1
            let maximumCarNameLength: Int = 5
            return minimumCarNameLength...maximumCarNameLength
        }()
        static let minimumRaceCountToStart: Int = 1
    }
    
    func isValideRaceCount(of raceCount: Int) -> Bool {
        return raceCount >= Constants.minimumRaceCountToStart
    }
    
    func isValidCarNames(of carNames: [String]) -> Bool {
        let isValidCarNames: Bool = carNames.allSatisfy { carName in
            Constants.carNameLengthRange ~=  carName.count
        }
        return isValidCarNames
    }
}
