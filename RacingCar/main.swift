//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let inputView = RacingInputView()
let resultView = RacingResultView()

do {
    let game = try inputView.readInput()
    for _ in 0..<game.roundCount {
        game.playOneRound()
        resultView.printRoundResult(in: game)
    }
} catch {
    print("Error! \(error)")
}
