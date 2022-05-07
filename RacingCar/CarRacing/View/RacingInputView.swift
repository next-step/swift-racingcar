//
//  RacingInputView.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/05.
//

import Foundation

struct RacingInputView {
    private struct Comments {
        static let askingParticipantsCount: String = "자동차 대수는 몇 대인가요?"
        static let askingDrivingCount: String = "시도할 횟수는 몇 회인가요?"
    }
    
    public func readInput() throws -> RacingGame {
        let participantCount = self.readParticipantsCount()
        let drivingCount = self.readDrivingCount()
        let game = try RacingGame(participantsCount: participantCount, roundCount: drivingCount)
        return game
    }
    
    private func readParticipantsCount() -> Int? {
        print(Comments.askingParticipantsCount, terminator: " ")
        guard let input = readLine(), let count = Int(input) else { return nil }
        return count
    }
    
    private func readDrivingCount() -> Int? {
        print(Comments.askingDrivingCount, terminator: " ")
        guard let input = readLine(), let count = Int(input) else { return nil }
        return count
    }
}

