//
//  RacingInputView.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/05.
//

import Foundation

struct RacingInputView {
    private struct Comments {
        static let askingParticipants: String = "경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분)."
        static let askingRoundCount: String = "시도할 횟수는 몇 회인가요?"
    }
    
    func readInput() throws -> RacingGame {
        let participantCount = self.readParticipants(with: Comments.askingParticipants)
        let roundCount = self.readCount(with: Comments.askingRoundCount)
        let game = try RacingGame(participantsCount: participantCount, roundCount: roundCount)
        return game
    }
    
    private func readParticipants(with comment: String) -> Int? {
        print(comment)
        guard let input = readLine() else { return nil }
        let participants = input.components(separatedBy: ",")
        return participants.count
    }
    
    private func readCount(with comment: String) -> Int? {
        print(comment)
        guard let input = readLine(), let count = Int(input) else { return nil }
        return count
    }
    
}

