//
//  GameInfo.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/26.
//

import Foundation

protocol RacingPlayable {
    func racingGameCarNumber() -> Int
    func racingGameRound() -> Int
}

struct GameInfo: RacingPlayable {
    private let carNumber: Int
    private let round: Int
    
    init(carNumber: Int, round: Int) {
        self.carNumber = carNumber
        self.round = round
    }
    
    func racingGameCarNumber() -> Int {
        carNumber
    }
    
    func racingGameRound() -> Int {
        round
    }
}
