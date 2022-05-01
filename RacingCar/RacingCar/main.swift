//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let inputView = InputView()
    let carNames: [String] = try inputView.recieveCarNames()
    let raceCount: Int = try inputView.recieveRaceCount()
    let roundHistory: RoundHistory = roundHistoryAfterPlayGame(carNames: carNames,
                                                               raceCount: raceCount)
    showResult(using: roundHistory)
} catch let error as UserInputError { 
    let errorView = ErrorView()
    errorView.guideInputError(of: error)
}

private func roundHistoryAfterPlayGame(carNames: [String], raceCount: Int) -> RoundHistory {
    let randomDigitNumberMaker = RandomDigitNumberMaker()
    let racingCarGame = RacingCarGame(carNames: carNames,
                                      raceCount: raceCount,
                                      randomDigitNumberMaker: randomDigitNumberMaker)
    racingCarGame.start()
    return racingCarGame.roundHistory
}

private func showResult(using roundHistory: RoundHistory) {
    let resultView = ResultView(roundHistory: roundHistory)
    resultView.draw()
}
