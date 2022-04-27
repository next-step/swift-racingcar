//
//  GameInfo.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/26.
//

import Foundation

protocol RacingPlayable {
    func racingGameCarNumber() -> Int
    func racingGameMatchNumber() -> Int
}

struct GameInfo: RacingPlayable {
    private var carNumber: Int
    private var matchNumber: Int
    
    init(carNumber: Int, matchNumber: Int) {
        self.carNumber = carNumber
        self.matchNumber = matchNumber
    }
    
    func racingGameCarNumber() -> Int {
        carNumber
    }
    
    func racingGameMatchNumber() -> Int {
        matchNumber
    }
}
