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
        var game = RacingGame()
        self.readParticipantsCount(for: &game)
        self.readDrivingCount(for: &game)
        try catchInputError(for: game)
        
        return game
    }
    
    private func readParticipantsCount(for game: inout RacingGame) {
        print(Comments.askingParticipantsCount, terminator: " ")
        if let input = readLine(), let count = Int(input) {
            game.participantsCount = count
        }
    }
    
    private func readDrivingCount(for game: inout RacingGame) {
        print(Comments.askingDrivingCount, terminator: " ")
        if let input = readLine(), let count = Int(input) {
            game.drivingCount = count
        }
    }
    
    private func catchInputError(for game: RacingGame) throws {
        guard let participantsCount = game.participantsCount else { throw RacingInputError.emptyInput }
        guard let drivingCount = game.drivingCount else { throw RacingInputError.emptyInput }
        
        guard participantsCount > 0 else { throw RacingInputError.invalidInput }
        guard drivingCount > 0 else { throw RacingInputError.invalidInput }
    }
}

enum RacingInputError: Error {
    case invalidInput
    case emptyInput
}
