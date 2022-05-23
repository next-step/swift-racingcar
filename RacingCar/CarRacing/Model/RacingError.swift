//
//  RacingError.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/03.
//

import Foundation

enum RacingError: Error {
    case nonInitRace
    case emptyInput
    case invalidInput
    case tooManyRound
    case tooLongParticipantName
}
