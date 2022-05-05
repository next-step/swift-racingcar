//
//  main.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

let carCount = InputView.inputCarCount()
if InputChecker.isValidCarCount(carCount) == false {
    OutputView.carCountIsInvalid()
    exit(0)
}

let roundCount = InputView.inputRoundCount()
if InputChecker.isValidRoundCount(roundCount) == false {
    OutputView.roundCountIsInvalid()
    exit(0)
}

let racingCars = (0..<carCount!).map { id in
    RacingCarFactory.create(id: id)
}

var racingGame = try RacingGame(racingCars: racingCars, roundCount: roundCount!)
let racingGameResult = racingGame.start()
let formattedResult = GameResultFormatter.format(racingGameResult)
OutputView.show(formattedResult)
