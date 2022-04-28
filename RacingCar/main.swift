//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let (carCount, raceCount): (Int, Int) = try recieveUserInput()
let raceRecords: [[Car]] = getRacingCarRecords(carCount: carCount, raceCount: raceCount)
showResult(with: raceRecords)

private func recieveUserInput() throws -> (carCount: Int, raceCout: Int) {
    let inputView: InputView = InputView()
    let carCount: Int = try inputView.recieveCarCount()
    let raceCount: Int = try inputView.recieveRaceCount()
    return (carCount, raceCount)
}

private func getRacingCarRecords(carCount: Int, raceCount: Int) -> [[Car]]{
    let randomDigitNumberMaker: RandomDigitNumberMaker = RandomDigitNumberMaker()
    let racingCarGame: RacingCarGame = RacingCarGame(carCount: carCount,
                                                     raceCount: raceCount,
                                                     randomDigitNumberMaker: randomDigitNumberMaker)
    racingCarGame.start()
    let raceRecords: [[Car]] = racingCarGame.raceRecords
    return raceRecords
}

private func showResult(with raceRecords: [[Car]]) {
    let resultView = ResultView(raceRecords: raceRecords)
    resultView.drawFinalRaceRecords()
}
