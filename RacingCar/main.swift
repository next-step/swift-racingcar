//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let inputView = RacingInputView()
let resultView = RacingResultView()

do {
    var game = try inputView.readInput()
    for _ in 0..<game.roundCount {
        try game.playOneRound()
        resultView.printRoundResult(in: game)
    }
    resultView.printRacingWinner(in: game)
} catch {
    print("Error! \(error)")
}
