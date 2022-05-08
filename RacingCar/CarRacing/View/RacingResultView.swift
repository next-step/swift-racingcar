//
//  RacingResultView.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/05.
//

import Foundation

struct RacingResultView {
    private struct Comments {
        static let sayingWinners = "가 최종 우승했습니다.\n"
    }
    
    func printRoundResult(in game: RacingGame) {
        for participant in game.participants {
            drawLineGraph(for: participant)
        }
        print()
    }
    
    func printRacingWinner(in game: RacingGame) {
        let sortedParticipants = game.participants.sorted(by: { $0.position > $1.position })
        guard let longestDistance = sortedParticipants.first?.position else { return }
        let winnersName = sortedParticipants
            .filter({ $0.position == longestDistance })
            .map({ $0.name })
        print(winnersName.joined(separator: ", "), terminator: Comments.sayingWinners)
    }
    
    private func drawLineGraph(for participant: Car) {
        print("\(participant.name) : ", terminator: "")
        for _ in 0..<participant.position {
            print("_", terminator: "")
        }
        print()
    }
}
