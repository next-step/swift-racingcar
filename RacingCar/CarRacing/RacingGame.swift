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
    private(set) var roundCount: Int
    
    private(set) var currentRound: Int = 0
    
    var participants: [Car] = []
    
    init(participantsCount: Int?, roundCount: Int?) throws {
        guard let participantsCount = participantsCount else { throw RacingError.emptyInput }
        guard let roundCount = roundCount else { throw RacingError.emptyInput }
        
        guard participantsCount >= 0 else { throw RacingError.invalidInput }
        guard roundCount >= 0 else { throw RacingError.invalidInput }

        self.participantsCount = participantsCount
        self.roundCount = roundCount
        self.setRacingGame()
    }
    
    private mutating func setRacingGame()  {
        for _ in 0..<participantsCount {
            participants.append(Car(position: 0))
        }
    }
    
    private func excuteParticipantTurn(participant index: Int) {
        let randomNumber = Int.random(in: Const.randomRange)
        participants[index].drive(by: randomNumber)
    }
    
    mutating func playOneRound() throws {
        guard currentRound < roundCount else { throw RacingError.tooManyRound }
        self.currentRound += 1
        for participantIndex in 0..<participantsCount {
            excuteParticipantTurn(participant: participantIndex)
        }
    }
}

