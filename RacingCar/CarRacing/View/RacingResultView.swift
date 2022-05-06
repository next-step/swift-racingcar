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
            drawLineGraph(length: participant.position)
        }
        print()
    }
    
    private func drawLineGraph(length: Int) {
        for _ in 0..<length {
            print("_", terminator: "")
        }
        print()
    }
}
