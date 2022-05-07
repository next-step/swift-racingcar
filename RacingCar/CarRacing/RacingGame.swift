//
//  RacingGame.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/03.
//

import Foundation

struct RacingGame {
    private struct Const {
        static let randomRange: ClosedRange<Int> = 0...9
    }
    
    private var participantsCount: Int
    private var roundCount: Int
    
    var participants: [Car] = []
    
    init(participantsCount: Int?, roundCount: Int?) throws {
        guard let participantsCount = participantsCount else { throw RacingError.emptyInput }
        guard let roundCount = roundCount else { throw RacingError.emptyInput }
        
        guard participantsCount >= 0 else { throw RacingError.invalidInput }
        guard roundCount >= 0 else { throw RacingError.invalidInput }

        self.participantsCount = participantsCount
        self.roundCount = roundCount
        self.settingRacingGame()
    }
    
    private mutating func settingRacingGame()  {
        for _ in 0..<participantsCount {
            participants.append(Car(position: 0))
        }
    }
    
    private func excuteParticipantTurn(participant index: Int) {
        let randomNumber = Int.random(in: Const.randomRange)
        participants[index].drive(by: randomNumber)
    }
    
    func playOneRound() {
        for participantIndex in 0..<participantsCount {
            excuteParticipantTurn(participant: participantIndex)
        }
    }
}

