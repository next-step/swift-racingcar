//
//  RacingController.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/11.
//

import Foundation

struct RacingController {
    let inputView = RacingInputView()
    let resultView = RacingResultView()
    
    private var game: RacingGame?
    
    mutating func initRacing() throws {
        let input = inputView.readInput()
        self.game = try RacingGame(participants: input.participants,
                                   roundCount: input.roundCount,
                                   numberGenerator: RandomNumberGenerator(randomRange: RacingGame.Const.randomRange)
        )
    }
    
    func playRacing() throws {
        guard var game = game else { throw RacingError.nonInitRace }
        for _ in 0..<game.roundCount {
            try game.playOneRound()
            resultView.printRoundResult(in: game)
        }
        resultView.printRacingWinner(in: game)
    }
}
