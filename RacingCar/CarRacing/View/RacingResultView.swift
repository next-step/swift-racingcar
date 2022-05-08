//
//  RacingResultView.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/05.
//

import Foundation

struct RacingResultView {
    func printRoundResult(in game: RacingGame) {
        for participant in game.participants {
            drawLineGraph(for: participant)
        }
        print()
    }
    
    private func drawLineGraph(for participant: Car) {
        print("\(participant.name) : ", terminator: "")
        for _ in 0..<participant.position {
            print("_", terminator: "")
        }
        print()
    }
}
