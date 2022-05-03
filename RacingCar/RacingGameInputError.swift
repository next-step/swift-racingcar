//
//  RacingGameInputError.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/05/03.
//

import Foundation


enum InputViewError: Error {
    case incorrectFormat
    case minusCount
    case input
    case textLengthExceeded
    case emptyCars
}
