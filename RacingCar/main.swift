//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let inputView = InputView()
    let carCount: Int = try inputView.recieveCarCount()
    let raceCount: Int = try inputView.recieveRaceCount()
    let roundHistory: RoundHistory = roundHistoryAfterPlayGame(carCount: carCount,
                                                               raceCount: raceCount)
    showResult(using: roundHistory)
} catch {
    let errorView = ErrorView()
    errorView.guideNotIntInputError()
}

private func roundHistoryAfterPlayGame(carCount: Int, raceCount: Int) -> RoundHistory {
    let randomDigitNumberMaker = RandomDigitNumberMaker()
    let racingCarGame = RacingCarGame(carCount: carCount,
                                      raceCount: raceCount,
                                      randomDigitNumberMaker: randomDigitNumberMaker)
    racingCarGame.start()
    return racingCarGame.roundHistory
}

private func showResult(using roundHistory: RoundHistory) {
    let resultView = ResultView(roundHistory: roundHistory)
    resultView.draw()
}
