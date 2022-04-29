//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let (carCount, raceCount): (Int, Int) = try recieveUserInput()
let roundHistory: RoundHistory = roundHistoryAfterPlayGame(carCount: carCount,
                                                           raceCount: raceCount)
showResult(using: roundHistory)

private func recieveUserInput() throws -> (carCount: Int, raceCout: Int) {
    let inputView: InputView = InputView()
    let carCount: Int = try inputView.recieveCarCount()
    let raceCount: Int = try inputView.recieveRaceCount()
    return (carCount, raceCount)
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
