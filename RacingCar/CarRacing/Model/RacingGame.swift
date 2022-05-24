//
//  RacingGame.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/03.
//

import Foundation

struct RacingGame {
    struct Const {
        static let randomRange: ClosedRange<Int> = 0...9
    }
    
    private(set) var roundCount: Int
    private(set) var currentRound: Int = 0
    
    private let numberGenerator: NumberGeneratable
    
    var participants: [Car] = []
    
    init(participants: [String]?, roundCount: Int?, numberGenerator: NumberGeneratable) throws {
        guard let participants = participants else { throw RacingError.emptyInput }
        guard let roundCount = roundCount else { throw RacingError.emptyInput }
        
        guard roundCount >= 0 else { throw RacingError.invalidInput }
        if participants.contains(where: { $0.count > 5 }) { throw RacingError.tooLongParticipantName }
        
        self.numberGenerator = numberGenerator
        self.roundCount = roundCount
        self.setRacingGame(by: participants)
    }
    
    private mutating func setRacingGame(by participantNames: [String])  {
        self.participants = participantNames
            .map({ Car(name: $0, position: 0) })
    }
    
    private func excuteParticipantTurn(participant index: Int) {
        let number = numberGenerator.generate()
        participants[index].drive(by: number)
    }
    
    mutating func playOneRound() throws {
        guard currentRound < roundCount else { throw RacingError.tooManyRound }
        for participantIndex in 0..<participants.count {
            excuteParticipantTurn(participant: participantIndex)
        }
        self.currentRound += 1
    }
}

