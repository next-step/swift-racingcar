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
        static let moveSuccessableRange: ClosedRange<Int> = 4...9
    }
    
    var participantsCount: Int
    var drivingCount: Int
    
    var participants: [Car] = []
    
    init(participantsCount: Int, drivingCount: Int) {
        self.participantsCount = participantsCount
        self.drivingCount = drivingCount
        self.settingRacingGame()
    }
    
    private mutating func settingRacingGame()  {
        for _ in 0..<participantsCount {
            participants.append(Car(position: 0))
        }
    }
    
    func drive(participant index: Int) {
        let randomNumber = Int.random(in: Const.randomRange)
        if Const.moveSuccessableRange ~= randomNumber {
            participants[index].moveForword()
        }
    }
    
    func playOneRound() {
        for participantIndex in 0..<participantsCount {
            drive(participant: participantIndex)
        }
    }
}

