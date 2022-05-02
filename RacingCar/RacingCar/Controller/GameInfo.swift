//
//  GameInfo.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/26.
//

import Foundation

protocol RacingPlayable {
    func racingGamePlayers() -> [String]
    func racingGameRound() -> Int
}

struct GameInfo: RacingPlayable {
    private let players: [String]
    private let round: Int
    
    init(players: [String], round: Int) {
        self.players = players
        self.round = round
    }
    
    func racingGamePlayers() -> [String] {
        players
    }
    
    func racingGameRound() -> Int {
        round
    }
}
