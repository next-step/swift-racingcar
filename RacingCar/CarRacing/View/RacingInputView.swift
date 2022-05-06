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
        let participantCount = try self.readParticipantsCount()
        let drivingCount = try self.readDrivingCount()
        let game = RacingGame(participantsCount: participantCount, drivingCount: drivingCount)
        return game
    }
    
    private func readParticipantsCount() throws -> Int {
        print(Comments.askingParticipantsCount, terminator: " ")
        guard let input = readLine() else { throw RacingError.emptyInput }
        guard let count = Int(input), count > 0 else { throw RacingError.invalidInput }
        return count
    }
    
    private func readDrivingCount() throws -> Int {
        print(Comments.askingDrivingCount, terminator: " ")
        guard let input = readLine(), let count = Int(input) else { throw RacingError.emptyInput }
        guard let count = Int(input), count > 0 else { throw RacingError.invalidInput }
        return count
    }
}

enum RacingInputError: Error {
    case invalidInput
    case emptyInput
}
