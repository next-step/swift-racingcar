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
        static let askingRoundCount: String = "시도할 횟수는 몇 회인가요?"
    }
    
    func readInput() throws -> RacingGame {
        let participantCount = self.readCount(with: Comments.askingParticipantsCount)
        let roundCount = self.readCount(with: Comments.askingRoundCount)
        let game = try RacingGame(participantsCount: participantCount, roundCount: roundCount)
        return game
    }
    
    private func readCount(with comment: String) -> Int? {
        print(comment, terminator: " ")
        guard let input = readLine(), let count = Int(input) else { return nil }
        return count
    }
    
}

